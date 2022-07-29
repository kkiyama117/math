//
// Created by kiyama on 6/28/22.
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

typedef double (*BaseFunc)(double, double);

// 分割数n, f(x0)=f0
double runge(double t_0, double t_n, int n, double y_0, BaseFunc f);

//double runge(double t_0, double t_n, int n, BaseFunc df);
double dp(double x, double y);

double p(double x);

double f(double x, double y) {
    return x * y;
}

double y_true(double x) {
    return 4.0 * exp(x * x / 2.0);
}

int main(int argc, char *args[]) {
    double x = 0.;
    double y = 4.;
    double eps = 0.00001;
    double result = runge(x, 3.0, 100, y, f);

    printf("x=%f\n", result);
    return 0;
}

double runge(double t_0, double t_n, int n, double y_0, BaseFunc f) {
    int i;
    double y, t, h, k, k1, k2, k3, k4;
    y = y_0;
    t = t_0;
    h = (t_n - t_0) / n;

    // 漸化式を計算
    printf("x       y       y_true\n");
    for (i = 1; i <= n; i++) {
        k1 = h * f(t, y);
        k2 = h * f(t + h / 2., y + k1 / 2.);
        k3 = h * f(t + h / 2., y + k2 / 2.);
        k4 = h * f(t + h, y + k3);
        k = (k1 + 2. * k2 + 2. * k3 + k4) / 6.;
        y += k;
        t += h;
        printf("%5.5lf, %5.5lf, %5.5lf\n", t, y, y-y_true(t));
    }
    return y;
}
