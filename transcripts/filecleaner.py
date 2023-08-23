import os

def rename_files_in_directory(directory):
    for dirpath, dirnames, filenames in os.walk(directory):
        print(f"Checking directory: {dirpath}")

        for filename in filenames:
            print(f"Inspecting file: {filename}")

            if ' ' in filename:
                new_filename = filename.replace(' ', '_')
                old_file_path = os.path.join(dirpath, filename)
                new_file_path = os.path.join(dirpath, new_filename)

                print(f"Renaming: {old_file_path} -> {new_file_path}")
                os.rename(old_file_path, new_file_path)
            else:
                print(f"No spaces in filename: {filename}")

if __name__ == '__main__':
    # Automatically get the current directory from where the script is executed
    base_directory = os.getcwd()
    print(f"Starting from directory: {base_directory}")
    rename_files_in_directory(base_directory)

