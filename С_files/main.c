#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "functions.h"

int main(int argc, char **argv)
{
    char *e;
    double points[8];
    long long num_of_rep = 0;

    int choice = get_type_of_work(argc, argv);
    if (choice == 0)
    {
        num_of_rep = get_number_or_repeats(choice, argv);
        get_points(points);
    }
    else if (choice == 1)
    {
        num_of_rep = get_number_or_repeats(choice, argv);
        get_points_file(points, argv);
    }
    else if (choice == 2)
    {
        generate_points(points);
        num_of_rep = strtol(argv[2], &e, 10);
    }
    else
    {
        puts("Произошла ошибка исполнения!\n");
        return 0;
    }
    print_input(points, num_of_rep);
    check_points(points, choice, argv, num_of_rep);
    return 0;
}