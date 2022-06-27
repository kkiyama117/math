//
// Created by kiyama on 6/28/22.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>


double f(double x) {
    return x - cos(x);
}

double df(double x) {
    return 1 + sin(x);
}

int main(int argc, char *args[]) {
    double x = 1.;
    double eps = 0.000001;

    for (int i = 0; i < 100; i++) {
        x = x - f(x) / df(x);
        if (fabs(f(x)) < eps) {
            break;
        }
    }
    printf("x=%f\n", x);
    return 0;
}
