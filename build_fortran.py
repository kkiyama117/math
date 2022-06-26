import os
import subprocess

import sys
import pathlib
from pathlib import Path
import shutil
import time

if __name__ == "__main__":
    args = sys.argv
    if len(args) >= 2 and args[1] is not None:
        num = int(args[1])
    else:
        num = int(input("input num"))

    build_dir = Path('build')
    results_dir = Path('results')
    source_dir = Path('fortran')
    output_dir = results_dir / f"{num}"

    source_file = source_dir / f"kadai{num}.f90"
    run_file = build_dir / "bin" / f"kadai{num}"
    run_out_file = results_dir / 'kadai_run.txt'
    output_file = output_dir / 'kadai.txt'

    print("remove old files")
    # warning!
    try:
        if build_dir.exists():
            shutil.rmtree(build_dir)
        if run_out_file.exists():
            os.remove(run_out_file)
        if output_file.exists():
            os.remove(output_file)
        build_dir.mkdir()
        if not output_dir.exists():
            output_dir.mkdir()
    except FileNotFoundError as e:
        print(e)

    print("building...")
    subprocess.call(['cmake', '..', '-DCMAKE_BUILD_TYPE=Release'], cwd=build_dir)
    subprocess.call(['make'], cwd=build_dir)
    print("running...")
    subprocess.call([str(run_file.absolute())], cwd=build_dir)

    while not run_file.exists():
        time.sleep(1)
    with open(run_out_file, 'w') as f:
        subprocess.Popen([run_file], stdout=f, stderr=f)
    print("write...")
    if run_out_file.is_file():
        with open(output_file, 'w') as f:
            f.write('他課題のソースやMakefile,ビルド用プログラム等の実行環境については https://github.com/kkiyama117/math をご確認下さい.\n')
            f.write('------------------------------\n')
            f.write('ソース\n')
            f.write('------------------------------\n')
            with open(source_file, 'r') as f2:
                for li in f2.readlines():
                    f.write(li)
            f.write('\n------------------------------\n')
            f.write('出力(pythonで取得)\n')
            f.write('------------------------------\n')
            time.sleep(1)
            with open(run_out_file, 'r') as f2:
                for li in f2.readlines():
                    f.write(li)
            f.write('\n------------------------------\n')
            f.write('他課題のソースやMakefile,ビルド用プログラム等の実行環境については https://github.com/kkiyama117/math をご確認下さい.\n')
        with open(run_out_file, 'r') as fin:
            print(fin.read())
    else:
        raise ValueError("%s isn't a file!" % run_out_file)
    print("end")
