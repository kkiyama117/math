//
// Created by kiyama on 11/14/22.
//
#include <stdio.h>

int factorial(int n)
{
    int result = 1;
    for(int i = 0; i < n; i++)
    {
        result = result * (i +1);
    }
    return result;
}

double exponentiation(double x, int k)
{
    double result = 1;
    for (int i = 0; i < k; i++) {
        result = result * x;
    }
    return result;
}

double sin_mac(double x, int k)
{
    double result = 0, s;
    for (int i = 0; i <= k; i++)
    {
        s = ((i % 2) == 0) ? 1.0 : -1.0;
    }
    return result;
}

int main(int argc, char *args[]) {
    double y, x = 1;
    int item_num = 2;
    int max_count = 10000;

    for (int i = 0; i < max_count; i++)
    {
        y = sin_mac(x, item_num);
    }
    return 0;
}

