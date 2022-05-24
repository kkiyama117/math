import subprocess

import itertools
import os.path
import time

if __name__ == "__main__":
    folderPath = "build"
    run_out_file = 'results/kadai_run.txt'
    output_file = 'results/kadai.txt'
    source_file = 'src/kadai3.f90'
    run_file = './build/bin/kadai3'

    # subprocess.call(['./build.zsh'])
    print("remove old files")
    subprocess.call(['rm', '-rf', folderPath])
    subprocess.call(['rm', '-f', run_out_file])
    subprocess.call(['rm', '-f', output_file])
    while os.path.exists(folderPath):
        time.sleep(1)
    print("building...")
    subprocess.call(['mkdir', '-p', folderPath])
    subprocess.call(['cmake', '..', '-DCMAKE_BUILD_TYPE=Release'], cwd=folderPath)
    subprocess.call(['make'], cwd=folderPath)
    print("running...")
    subprocess.call(['./bin/main'], cwd=folderPath)

    while not os.path.exists(run_file):
        time.sleep(1)
    with open(run_out_file, 'w') as f:
        subprocess.Popen([run_file], stdout=f, stderr=f)
    print("write...")
    if os.path.isfile(run_out_file):
        with open(output_file, 'w') as f:
            f.write('ソース\n')
            f.write('------------------------------\n')
            with open(source_file, 'r') as f2:
                for li in f2.readlines():
                    f.write(li)
            f.write('------------------------------\n')
            f.write('出力(pythonで取得)\n')
            f.write('------------------------------\n')
            time.sleep(1)
            with open(run_out_file, 'r') as f2:
                for li in f2.readlines():
                    f.write(li)
            f.write('\n------------------------------\n')
    else:
        raise ValueError("%s isn't a file!" % run_out_file)
    print("end")
