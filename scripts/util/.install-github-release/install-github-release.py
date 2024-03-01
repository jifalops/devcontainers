import requests
import platform
import subprocess
import os
import sys
from requests.exceptions import RequestException


def parse_argument():
    if len(sys.argv) != 2:
        print("Usage: python install-github-release.py user/repo", file=sys.stderr)
        sys.exit(1)
    return sys.argv[1]


def get_latest_release(user_repo):
    api_url = f"https://api.github.com/repos/{user_repo}/releases/latest"
    try:
        response = requests.get(api_url)
        response.raise_for_status()
        return response.json()
    except RequestException as e:
        print(f"Error fetching release data: {e}", file=sys.stderr)
        sys.exit(1)


def get_os_architecture():
    os_name = platform.system().lower()
    architecture = platform.machine().lower()
    if os_name not in ['linux', 'darwin']:
        print("Unsupported OS. Only Linux and MacOS are supported.", file=sys.stderr)
        sys.exit(1)
    return os_name, architecture


def filter_assets(assets, os_name, architecture):
    preferred_extension = '.deb' if os_name == 'linux' else '.dmg'
    architecture_aliases = {
        'x86_64': ['x86_64', 'amd64', 'x64'],
        'arm64': ['arm64', 'aarch64'],
        # Add more architecture and their aliases here if needed
    }

    # Determine the list of architecture names to check for
    arch_to_check = architecture_aliases.get(architecture, [architecture])

    filtered_assets = []
    for asset in assets:
        filename = asset['name'].lower()
        if os_name in filename and any(arch in filename for arch in arch_to_check):
            filtered_assets.append(asset)

    # Prefer .deb for Linux and .dmg for MacOS
    for asset in filtered_assets:
        if preferred_extension in asset['name']:
            return asset

    if not filtered_assets:
        print(
            "No suitable assets found for the current OS and architecture.", file=sys.stderr)
        sys.exit(1)

    # Return the first match if no preferred extension found
    return filtered_assets[0]


def download_file(url, filename):
    try:
        response = requests.get(url, stream=True)
        response.raise_for_status()
        with open(filename, 'wb') as file:
            for chunk in response.iter_content(chunk_size=8192):
                file.write(chunk)
        return filename
    except RequestException as e:
        print(f"Error downloading file: {e}", file=sys.stderr)
        os.remove(filename)
        sys.exit(1)


def install_package(file_path, os_name):
    try:
        if os_name == 'linux':
            subprocess.run(['sudo', 'dpkg', '-i', file_path], check=True)
        elif os_name == 'darwin':
            subprocess.run(['hdiutil', 'attach', file_path], check=True)
            subprocess.run(
                ['cp', '-R', f"/Volumes/{os.path.basename(file_path, '.dmg')}/*.app", '/Applications/'], check=True)
            subprocess.run(['hdiutil', 'detach', file_path], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Installation failed: {e}", file=sys.stderr)
        sys.exit(1)


def cleanup(file_path):
    os.remove(file_path)


def main():
    user_repo = parse_argument()
    release_data = get_latest_release(user_repo)
    os_name, architecture = get_os_architecture()
    asset = filter_assets(release_data['assets'], os_name, architecture)
    file_path = download_file(asset['browser_download_url'], asset['name'])
    install_package(file_path, os_name)
    cleanup(file_path)
    print(
        f"Successfully installed {asset['name']} from https://github.com/{user_repo}/releases/latest")


if __name__ == "__main__":
    main()
