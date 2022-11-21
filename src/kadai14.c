//
// Created by kiyama on 11/14/22.
//
#include <stdio.h>

// ヘッダ
double log_mac(double x, int k);

double exponentiation(double x, int k);

int factorial(int n);

// マクローリン展開の時間評価
int main(int argc, char *args[]) {
    double y;

    double x = 1;
    // マクローリン展開で用いる項(第item_num項目まで)
    int item_num = 1;
    // 関数の実行時間を計測するために繰り返す回数
    int max_count = 10;

    // マクローリン展開(item_num番目まで)してxを代入する作業をmax_count回繰り返す
    for (int i = 0; i < max_count; i++) {
        y = log_mac(x, item_num);
        printf("マクローリン展開の結果は%10f\n", y);
    }
    return 0;
}

// x近傍での exponential マクローリン展開(item_num番目まで)
double log_mac(double x, int k) {
    double result = 0;
    for (int i = 0; i <= k; i++) {
//        result += exponentiation(x, i) / ((double) factorial(i));
        // 偶奇
        double a = (i % 2) ? -1 : 1;
        // 第i項
        double item_i = a * exponentiation(x, i) / ((double) i + 1);
        printf("test%10f\n", item_i);
        result += item_i;
    }
    return result;
}

// xのk乗
double exponentiation(double x, int k) {
    double result = 1;
    for (int i = 0; i < k; i++) {
        result = result * x;
    }
    return result;
}


// nの階乗
int factorial(int n) {
    int result = 1;
    // 1からnまで
    for (int i = 0; i < n; i++) {
        result = result * (i + 1);
    }
    return result;
}
