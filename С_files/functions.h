#ifndef FUNCTIONS_H
#define FUNCTIONS_H

void get_points(double points[]);

void generate_points(double points[]);

void get_points_file(double points[], char **argv);

int get_type_of_work(int argc, char **argv);

void print_input(double points[], long long num_of_rep);

int is_in_circle(double points[]);

void check_points(double points[], int choice, char **argv, long long num_of_rep);

long long get_number_or_repeats(int choice, char **argv);

#endif /*FUNCTIONS_H*/
