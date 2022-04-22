import subprocess

if __name__ == "__main__":
    print("building...")
    folderPath = "build"
    # subprocess.call(['./build.zsh'])
    subprocess.call(['mkdir', '-p', folderPath])
    subprocess.call(['cmake', '..', '-DCMAKE_BUILD_TYPE=Debug '], cwd=folderPath)
    subprocess.call(['make'],cwd=folderPath)
    subprocess.call(['./main'],cwd=folderPath)
    print("end")
