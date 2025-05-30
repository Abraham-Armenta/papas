#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void bubble_sort(int vector[], int n);

int main()
{
    int vector[5];
    srand(time(NULL));

    for (int i = 0; i < 5; i++)
    {
        vector[i] = rand() % 100;
    }

    bubble_sort(vector, 5);

    for (int i = 0; i < 5; i++)
    {
        printf("%d ", vector[i]);
    }
    printf("\n");

    return 0;
}

void bubble_sort(int vector[], int n)
{
    for (int i = 0; i < n - 1; i++)
    {
        for (int j = 0; j < n - i - 1; j++)
        {

                if (vector[j] > vector[j + 1])
            {
                int temp = vector[j];
                vector[j] = vector[j + 1];
                vector[j + 1] = temp;
            }
        }
    }
}
