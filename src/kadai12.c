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

// get a0~a6
void q_1(double data_matrix[2][18], double result[6]) {
    // cp=a0+a1x+a2x^2+...+a6x^6
    // 6次式なので6*7で用意
    double a[Q1_N][Q1_N + 1];

    double p, dd;
    int i = 0, j, k, m = 18;

    // 欲しい行列の作成
    for (i = 0; i < Q1_N; i++) {
        for (j = 0; j < Q1_N; j++) {
            for (k = 0; k < m; k++) {
                a[i][j] += pow(data_matrix[0][k], (double) (i + j));
            }
        }
    }
    a[0][0] = (double) m; // to double
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
    // return result
    for (k = 0; k < Q1_N; k++) {
        result[k] = a[k][Q1_N];
    }
}


int main(int argc, char *args[]) {
    int k;
    int i;
    double f = 0.0;

    printf("Q1\n");
    double d_n2[2][18] = {{0.3,    0.4,    0.5,    0.6,    0.7,    0.8,    0.9,    1.0,    1.1,    1.2,    1.3,    1.4,    1.5,    1.6,    1.7,    1.8,    1.9,    2.0},
                          {29.139, 29.260, 29.591, 30.122, 30.767, 31.445, 32.107, 32.714, 33.258, 33.743, 34.166, 34.543, 34.869, 35.154, 35.405, 35.631, 35.828, 36.004}};
    double d_co2[2][18] = {{0.3,    0.4,    0.5,    0.6,    0.7,    0.8,    0.9,    1.0,    1.1,    1.2,    1.3,    1.4,    1.5,    1.6,    1.7,    1.8,    1.9,    2.0},
                           {37.239, 41.345, 44.648, 47.344, 49.587, 51.458, 53.024, 54.334, 55.435, 56.369, 57.164, 57.830, 58.407, 58.914, 59.345, 59.730, 60.077, 60.379}};
    double a_n2[6];
    double a_co2[6];
    q_1(d_n2, a_n2);
    q_1(d_co2, a_co2);

    // n2
    printf("N2\n");
    for (k = 0; k < Q1_N; k++) {
        printf("a%d= %lf\n", k, a_n2[k]);
    }
    for (k = 0; k < 18; k++) {
        for (i = 0; i < Q1_N; i++) {
            f += a_n2[i] * pow(d_n2[0][k], (double) i);
        }
        printf("f%d= %lf\n", k, f);
    }
    // co2
    printf("CO2\n");
    for (k = 0; k < Q1_N; k++) {
        printf("a%d= %lf\n", k, a_co2[k]);
    }
}
