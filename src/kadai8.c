//
// Created by kiyama on 6/27/22.
//
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double f2(double x, double y, double p);

double runge_2(double y_0, double dy_0, double x_0, double x_n, int n, double **answer);

double real_df(double x);

#ifndef FALSE
#define FALSE (0)
#endif

#ifndef TRUE
#define TRUE (!FALSE)
#endif

// df == p


int main(int argc, char *args[]) {
    int n, m;
    double eps, y, dy, y_0, y_1, dy_min, dy_max;
    double **ans;
    double *base;

    // 固定
    n = 10;
    m = 3;
    y_0 = 0.;
    y_1 = 0.;
    dy_min = 0.;
    dy_max = 10.;
    eps = 0.00001;

    //結果が入る配列を連続したメモリで確保
    ans = (double **) malloc(n * sizeof(double *));
    base = (double *) malloc(n * m * sizeof(double));
    for (int i = 0; i < n; i++) {
        ans[i] = base + i * m;
    }

    /*メモリの確保に失敗した場合は終了する*/
    if (base == NULL) {
        printf("メモリの確保に失敗しました\n");
        exit(1);
    }
    // 初期値
    double base_y0 = runge_2(y_0, 0., 0., 1., n, ans);
//    double base_y1 = runge_2(y_0, 10., 0., 1., n, ans);

    while (TRUE) {
        dy = (dy_min + dy_max) / 2.;
        // get y(x=1)
        y = runge_2(y_0, dy, 0., 1., n, ans);
        // 誤差以内
        if (fabs(y - y_1) < eps) {
            break;
        } else {
            if (y * base_y0 < 0.) {
                dy_max = dy;
            } else {
                dy_min = dy;
            }
        }
    }
    // print results
    printf("---result---\n");
    printf("x=%f: y=%f dy=%f\n", 0., y_0, dy);
    for (int i = 0; i < n; i++) {
        printf("x=%f: y=%f dy=%f\n", ans[i][0], ans[i][1], ans[i][2]);
    }
    printf("---check answer---\n");
    printf("dy(0) = %f\n", dy);
    printf("real dy(0) = %f\n", real_df(0));
    /*確保したメモリを解放する*/
    free(ans);
    free(base);
    return 0;
}

double runge_2(double y_0, double dy_0, double x_0, double x_n, int n, double **answer) {
    int i;
    double y, p, x, h, k, k1, k2, k3, k4, l, l1, l2, l3, l4;
    y = y_0;
    p = dy_0;
    x = x_0;
    h = (x_n - x_0) / (double )n;

    // 漸化式を計算
    for (i = 0; i < n; i++) {
        k1 = h * p;
        k2 = h * (p + k1 / 2.);
        k3 = h * (p + k2 / 2.);
        k4 = h * (p + k3);
        k = (k1 + 2. * k2 + 2. * k3 + k4) / 6.;

        l1 = h * f2(x, y, p);
        l2 = h * f2(x + h / 2., y + k1 / 2., p + l1 / 2.);
        l3 = h * f2(x + h / 2., y + k2 / 2., p + l2 / 2.);
        l4 = h * f2(x + h, y + k3, p + l3);
        l = (l1 + 2. * l2 + 2. * l3 + l4) / 6.;

        y += k;
        p += l;
        x += h;
        answer[i][0] = x;
        answer[i][1] = y;
        answer[i][2] = p;
    }
    return y;
}

// get d2y/dx2
double f2(double x, double y, double p) {
    return -3. * p - 2. * y - 5. * cos(x);
}

// df = -2*C1*exp(-2x)-C2exp(-x)+sinx/2-3cosx/2
// c1,c2はx=0(c1+c2=1/2),x=1( c1/e^2+c2/e=0.5cos1+1.5sin1より)
double real_df(double x) {
    double c1 = -5.79855;
    double c2 = 6.29855;
    return -2 * c1 * exp(-2 * x) + (-1) * c2 * exp(-1 * x) + sin(x) / 2 + 3 * cos(x) / 2;
}