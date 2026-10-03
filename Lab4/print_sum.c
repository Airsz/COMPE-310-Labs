#include <stdio.h>

extern int sum(int *array, int count);    // needs the semicolon

int main()
{
    int arr[60];
    int i, s, count;
    FILE *file;

    file = fopen("data.txt", "r");
    fscanf(file, "%d", &count);

    for (i = 0; i < count; i++)
        fscanf(file, "%d", &arr[i]);      // needs & before arr[i]

    s = sum(arr, count);                  // lowercase sum, and arr (not array)
    printf("%d\n", s);

    fclose(file);
    return 0;
}