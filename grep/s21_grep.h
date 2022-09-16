#include <stdio.h>
#include <string.h>
#include <regex.h>

enum FLAGS {FLAG_E, FLAG_I, FLAG_V, FLAG_C, FLAG_L, FLAG_N};

int arguments(int arg_number, char *arg[]);
int s21_grep_no_argument(void);
int s21_grep_one_argument(char *arg[]);
int s21_grep_two_argument(int arg_number, char *arg[]);
int s21_grep_no_file(char *arg[], int number_file);
int s21_grep_files(int arg_number, char*arg[], int number_file);
int s21_grep_print(int flag_number, char *flags[]);
int s21_grep_flags(char *arg[]);
int s21_grep_flag_e(int arg_number, char *arg[], int k, int i);
int s21_grep_flag_i(int arg_number, char *arg[], int i);
int s21_grep_flag_v(int arg_number, char *arg[], int i);
int s21_grep_flag_c(int arg_number, char *arg[], int i);
int s21_grep_flag_l(char *arg[], int i);
int s21_grep_flag_n(int arg_number, char *arg[], int i);