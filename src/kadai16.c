//
// Created by kiyama on 11/14/22.
//
#include <stdio.h>
#include <time.h>

int factorial(int n)
{
    int result = 1;
    for (int i = 0; i < n; i++)
    {
        result = result * (i + 1);
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

double exp_mac(double x, int k)
{
    double result = 0;
    int a = 2;

    a = exponentiation(a,8);

    for (int i = 0; i <= k; i++)
    {
        result += a * exponentiation(x, i) / ((double)factorial(i));
    }
    return result;
}


int main(int argc, char* args[])
{
    //clock_t start_clock, end_clock;
    //start_clock = clock();

    double y, x = 1;
    int item_num = 15;
    int max_count = 2;

    for (int i = 0; i < max_count; i++)
    {
        y = exp_mac(x, item_num);
        printf("マクローリン展開の結果は%10f\n", y);
    }

    //end_clock = clock();
    //printf("clock:%f\n", (double)(end_clock - start_clock) / CLOCKS_PER_SEC);
    return 0;
}
