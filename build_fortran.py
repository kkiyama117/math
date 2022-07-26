import os
import subprocess

import sys
import pathlib
from enum import Enum
from pathlib import Path
import shutil
import time


class ProgType(Enum):
    F90 = 1
    C = 2


if __name__ == "__main__":
    args = sys.argv
    if len(args) >= 3:
        if args[1] is not None:
            num = int(args[1])
        else:
            num = int(args[1])
        if args[2] is not None and args[2] == "C":
            file_type = ProgType.C
        else:
            file_type = ProgType.F90
    elif len(args) >= 2:
        file_type = ProgType.F90
        if args[1] is not None:
            num = int(args[1])
        else:
            num = int(args[1])
    else:
        num = int(input("input num"))
        file_type = ProgType.F90

    if file_type is ProgType.C:
        source_dir = Path('src')
        file_type_suffix = "c"
    else:
        source_dir = Path('fortran')
        file_type_suffix = "f90"

    build_dir = Path('build')
    results_dir = Path('results')
    output_dir = results_dir / f"{num}"

    source_file = source_dir / f"kadai{num}.{file_type_suffix}"
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

    time.sleep(5)
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
