def convert():
    a = int(input('aを入力せよ'))
    n = int(input('nを入力せよ'))
    # ex: a = 2,n = 5
    z = []
    while n >= a:
        z.insert(0, n % a)
        # たぶん先生のミス
        n = n // a
    print(f'{a}進数にすると「', end='')
    print(n, end='')
    for y in z:
        print(y, end='')
    print('」となる')


if __name__ == "__main__":
    convert()
