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

typedef struct {
    double p;
    double q;
    double H;
} Result;

// 分割数n, f(x0)=f0
Result q1(double t_0, double t_n, int n, double p_0, double q_0);

int main(int argc, char *args[]) {
    double t_0 = 0.;
    double t_n = 6.30;
    double p_0 = 0.;
    double q_0 = 1.;
//    double eps = 0.00001;
    int n = 630;
    Result result = q1(t_0, t_n, n, p_0, q_0);

    printf("p=%f,q=%f\n", result.p, result.q);

    return 0;
}


Result q1(double t_0, double t_n, int n, double p_0, double q_0) {
    int i;
    double p, q, t, h, H;
//    double dp, dq;
    p = p_0;
    q = q_0;
    t = t_0;
    h = (t_n - t_0) / (double) n;

    // 漸化式を計算
    printf("t       p       q        H\n");
    printf("%5.5lf, %5.5lf, %5.5lf, %5.5lf\n", t, p, q, H);
    for (i = 0; i < n; i++) {
        Result r;
        // Euler法なら
//        dp = -q;
//        dq = p;
//        r.p = p + h * dp;
//        r.q = q + h * dq;
        r.q = (1.0 - 0.5 * pow(h, 2.0) + (1 / 24) * pow(h, 4.0)) * q + (h - (1 / 6) * pow(h, 3.0)) * p;
        r.p = (1.0 - 0.5 * pow(h, 2.0) + (1 / 24) * pow(h, 4.0)) * p - (h - (1 / 6) * pow(h, 3.0)) * q;
        t += h;
        r.H = 0.5 * (pow(r.p, 2.) + pow(r.q, 2.));
        printf("%5.5lf, %5.5lf, %5.5lf, %5.5lf\n", t, r.p, r.q, r.H);
        p = r.p;
        q = r.q;
        H = r.H;
    }
    Result r = {p, q, H};
    return r;
}

//
//double runge(double t_0, double t_n, int n, double y_0, BaseFunc f) {
//int i;
//double y, t, h, k, k1, k2, k3, k4;
//y = y_0;
//t = t_0;
//h = (t_n - t_0) / n;
//
//// 漸化式を計算
//printf("x       y       y_true\n");
//for (i = 1; i <= n; i++) {
//k1 = h * f(t, y);
//k2 = h * f(t + h / 2., y + k1 / 2.);
//k3 = h * f(t + h / 2., y + k2 / 2.);
//k4 = h * f(t + h, y + k3);
//k = (k1 + 2. * k2 + 2. * k3 + k4) / 6.;
//y += k;
//t += h;
//printf("%5.5lf, %5.5lf, %5.5lf\n", t, y, y - y_true(t));
//}
//return y;
//}
