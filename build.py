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
    output_file = 'results/kadai.txt'
    run_out_file2 = 'results/kadai_run.txt'
    with open(run_out_file2, 'w') as f:
        subprocess.Popen(['./build/bin/kadai3'], stdout=f, stderr=f)
    with open(output_file, 'w') as f:
        f.write('出力(pythonで取得)\n')
        f.write('------------------------------\n')
        with open(run_out_file2, 'r') as f2:
            for li in f2.readlines():
                f.write(li)
        f.write('------------------------------\n')
    print("end")
