//
// Created by kiyama on 11/14/22.
//
#include <stdio.h>
#include <math.h>

// ヘッダ
double log_sin(double x, int k);

double exponentiation(double x, int k);

int factorial(int n);

// マクローリン展開の時間評価
int main(int argc, char *args[]) {
    double y=0;

    double x = M_PI;
    // マクローリン展開で用いる項(第item_num項目まで)
    int item_num = 12;
    // 関数の実行時間を計測するために繰り返す回数
    int max_count = 1;

    // マクローリン展開(item_num番目まで)してxを代入する作業をmax_count回繰り返す
    for (int i = 0; i < max_count; i++) {
        y = log_sin(x, item_num);
        printf("マクローリン展開の結果は%10f\n", y);
    }
    return 0;
}

// x近傍での exponential マクローリン展開(item_num番目まで)
double log_sin(double x, int k) {
    double result = 0;
    // 第i項
    double item_i;
    for (int i = 0; i <= k; i++) {
        if (i % 2 == 0) {
            //偶数なら0
            item_i = 0;
        } else {
            // 奇数の時の符号
            // sinのn回微分はn=4m+1=>1,n=4m+3=>-1
            double a = (i % 4 == 1) ? 1 : -1;
            item_i = exponentiation(x,i) * a / ((double) factorial(i));
//            printf("test%d=%10f,%f\n",i, exponentiation(x,i),a);
        }
//        printf("test%d=%10f\n",i, item_i);
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
