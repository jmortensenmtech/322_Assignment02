// --------- FUNCTION IMPLEMENTATIONS ------------
#include "math_ops.h"

float multiply(float x, float y) 
{
    return x * y;
}

float add(float x, float y) 
{
    return x + y;
}

float square(float x) 
{
    return x * x;
}

float cube(float x) 
{
    return x * x * x;
}

float pow(float base, int exponent ) 
{
    float res = 1;
    for(int i = 0; i < exponent; i++) 
    {
        res *= base;
    }
    return res;
}

float sub(float a, float b)
{
    return a - b;
}

float divide(float a, float b)
{
    if (b == 0.0f)

    {
        printf("Error: Cannot divide by zero.");
        return 0.0f;
    }

    return a / b;
}

float sin(float a, int steps)
{
    //hardcode steps and convert a into radians
    steps = 10;
    a = a * 3.14159265358979323846f / 180.0f;

    float result = 0.0f;
    float term = a;

    result += term;

    for (int i = 1; i < steps; ++i) {
        int power = 2 * i + 1;
        term *= -a * a / ((power - 1) * power);
        result += term;
    }

    return result;
}

float cos(float a, int steps)
{
    //hardcode steps and convert a into radians
    steps = 10;
    a = a * 3.14159265358979323846f / 180.0f;

    float result = 0.0f;
    float term = 1.0f;

    for (int i = 1; i < steps; ++i) {
        int power = 2 * i;
        term *= -a * a / ((power - 1) * power);
        result += term;
    }

    return result;
}