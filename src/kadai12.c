//
// Created by kiyama on 7/12/22.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifndef FALSE
#define FALSE (0)
#endif

#ifndef TRUE
#define TRUE (!FALSE)
#endif

#ifndef Q1_N
#define Q1_N 6
#endif


void q_1(double data_matrix[2][18]) {
    printf("Q1\n");
    // cp=a0+a1x+a2x^2+...+a6x^6
    // 6次式なので6*7で用意
    double a[Q1_N][Q1_N + 1];

    double p, dd, f = 0.0, err = 0.0, ave_err, std_err1, std_err2;
    int i = 0, j, k, m = 18;

    // 欲しい行列の作成
    for (i = 0; i < Q1_N; i++) {
        for (j = 0; j < Q1_N; j++) {
            for (k = 0; k < m; k++) {
                a[i][j] += pow(data_matrix[0][k], (double) (i + j));
            }
        }
    }
    a[0][0] = m * 1.0; // to double
    for (i = 0; i < Q1_N; i++) {
        for (k = 0; k < m; k++) {
            // 右端に追加
            a[i][Q1_N] += pow(data_matrix[0][k], (double) i) * data_matrix[1][k];
        }
    }

    // Gaussの掃き出し法
    for (k = 0; k < Q1_N; k++) {
        p = a[k][k];
        for (j = k; j < Q1_N + 1; j++) {
            a[k][j] = a[k][j] / p;
        }
        for (i = 0; i < Q1_N; i++) {    /* pivot sweep out */
            if (i != k) {
                dd = a[i][k];
                for (j = k; j < Q1_N + 1; j++) {
                    a[i][j] = a[i][j] - dd * a[k][j];
                }
            }
        }
    }
    // print
    for (k = 0; k < Q1_N; k++) { printf("a%d= %lf\n", k, a[k][Q1_N]); }
}


int main(int argc, char *args[]) {
    double d_n2[2][18] = {{300,    400,    500,    600,    700,    800,    900,    1000,   1100,   1200,   1300,   1400,   1500,   1600,   1700,   1800,   1900,   2000},
                          {29.139, 29.260, 29.591, 30.122, 30.767, 31.445, 32.107, 32.714, 33.258, 33.743, 34.166, 34.543, 34.869, 35.154, 35.405, 35.631, 35.828, 36.004}};
    q_1(d_n2);
    printf("x=%f\n", 1.9);
}
