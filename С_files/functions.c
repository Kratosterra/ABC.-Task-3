#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void get_points(double points[])
{
    int n = 1;
    for (int i = 1; i < 9; ++i)
    {
        if (i % 2 != 0)
        {
            printf("--Точка %d----------------------------\n", n);
            printf("Введите координату x точки [%d]: ", n);
            scanf("%lf", &points[i - 1]);
        }
        else
        {
            printf("Введите координату y точки [%d]: ", n++);
            scanf("%lf", &points[i - 1]);
        }
    }
}

void generate_points(double points[])
{
    srand(time(0));
    for (size_t i = 0; i < 8; i++)
    {
        points[i] = ((double)rand() * (16000.00 - 0.001)) / (double)RAND_MAX + 0.001;
    }
}

void get_points_file(double points[], char **argv)
{
    FILE *f = fopen(argv[1], "r");
    int i = 0;
    double num = 0;
    while (fscanf(f, "%lf ", &num) > 0 && i < 8)
    {
        points[i++] = num;
    }
    fclose(f);
}

int get_type_of_work(int argc, char **argv)
{
    if (argc == 4)
    {
        puts("Производим генерацию!");
        FILE *fo = fopen(argv[3], "rb+");
        if (!fo)
        {
            puts("Внимание: Файл вывода не обнаружен или недоступен! Он будет создан.");
        }
        else
        {
            fclose(fo);
        }
        return 2;
    }
    else if (argc == 3)
    {
        puts("Производим cчитывание из файлов!");
        FILE *f = fopen(argv[1], "rb+");
        if (!f)
        {
            puts("Файл ввода не обнаружен или недоступен!");
            return -1;
        }
        fclose(f);
        FILE *fo = fopen(argv[2], "rb+");
        if (!fo)
        {
            puts("Внимание: Файл вывода не обнаружен или недоступен! Он будет создан.");
        }
        else
        {
            fclose(fo);
        }
        return 1;
    }
    else if (argc == 1)
    {
        puts("Начинаем работу в консольном режиме!");
        return 0;
    }
    else
    {
        puts("Неверное количество параметров, их всегда 4 - и файлы [-g] (генерация) или 2 - входной и выходной файл");
        return -1;
    }
}

void print_input(double points[], long long num_of_rep)
{
    printf("\n---------------------\nВведенные данные: \n");
    int n = 1;
    for (int i = 0; i < 8; i += 2)
    {
        printf("Точка %d:( x = %lf, y = %lf )\n", n, points[i], points[i + 1]);
        n++;
    }
    printf("Число повторений кода: %lld\n", num_of_rep);
    printf("--------------------\n");
}

int is_in_circle(double points[])
{
    double x_1 = points[0];
    double x_2 = points[2];
    double x_3 = points[4];
    double x_4 = points[6];
    double y_1 = points[1];
    double y_2 = points[3];
    double y_3 = points[5];
    double y_4 = points[7];
    double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
    if ((check) == 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

void check_points(double points[], int choice, char **argv, long long num_of_rep)
{
    int answer = 0;
    clock_t begin = clock();
    for (long long i = 0; i < num_of_rep; i++)
    {
        answer = is_in_circle(points);
    }
    clock_t end = clock();
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("Время исполнения программы: %f\n", time_spent);
    if (choice == 1)
    {
        printf("Ответ в файле вывода!\n");
        FILE *f = fopen(argv[2], "w+");
        if (answer)
        {
            fprintf(f, "- Точки принадлежат окружности\n");
        }
        else
        {
            fprintf(f, "- Точки не принадлежат окружности\n");
        }
        fclose(f);
    }
    else if (choice == 2)
    {
        printf("Ответ в файле вывода!\n");
        FILE *f = fopen(argv[3], "w+");
        if (answer)
        {
            fprintf(f, "- Точки принадлежат окружности\n");
        }
        else
        {
            fprintf(f, "- Точки не принадлежат окружности\n");
        }
        fclose(f);
    }
    else
    {
        if (answer)
        {
            printf("- Точки принадлежат окружности\n");
        }
        else
        {
            printf("- Точки не принадлежат окружности\n");
        }
    }
    printf("--------------------\n");
}

long long get_number_or_repeats(int choice, char **argv)
{
    long long num = 0;
    if (choice == 1)
    {
        FILE *f = fopen(argv[1], "r");
        int i = 0;
        double n = 0;
        while (fscanf(f, "%lf ", &n) > 0 && i < 8)
        {
        }
        fscanf(f, ":%lld", &num);
        fclose(f);
    }
    else
    {
        while (num <= 0 || num >= 9223372036854775000)
        {
            printf("Введите число повторений программы (от 1 до 9223372036854775000): ");
            scanf("%lld", &num);
        }
    }
    return num;
}