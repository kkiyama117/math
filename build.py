import subprocess

if __name__ == "__main__":
    folderPath = "build"
    # subprocess.call(['./build.zsh'])
    print("remove old files")
    subprocess.call(['rm', '-rf', folderPath])
    print("building...")
    subprocess.call(['mkdir', '-p', folderPath])
    subprocess.call(['cmake', '..', '-DCMAKE_BUILD_TYPE=Debug '], cwd=folderPath)
    subprocess.call(['make'], cwd=folderPath)
    print("running...")
    subprocess.call(['./bin/main'], cwd=folderPath)
    print("end")
