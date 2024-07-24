import os
from typing import List, Optional


def print_source_files(directory: str, ext: str) -> Optional[List[str]]:
    current_dir = os.getcwd()
    target_dir = os.path.join(current_dir, directory)

    if not os.path.isdir(target_dir):
        print(f"Directory not found: {target_dir}")
        return None

    os.chdir(target_dir)

    file_contents: List[str] = []

    try:
        for file in os.listdir('.'):
            if file.endswith(ext):
                print(f"# {target_dir}/{file}")
                try:
                    with open(file, 'r', encoding='utf-8') as f:
                        content = f.read()
                        print(content)
                        file_contents.append(content)
                    print()
                except IOError as e:
                    print(f"Error reading file {file}: {e}")
    finally:
        os.chdir(current_dir)

    return file_contents
