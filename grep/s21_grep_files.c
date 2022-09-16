//  Copyright 2022 michaleh
#include "./s21_grep.h"

int arguments(int arg_number, char *arg[]) {
    if (arg_number == 1) {
        s21_grep_no_argument();
    } else if (arg_number == 2) {
        s21_grep_one_argument(arg);
    } else if (arg_number == 3) {
        s21_grep_two_argument(arg_number, arg);
    } else if (arg_number > 3) {
        s21_grep_print(arg_number, arg);
    } return 0;
}

int s21_grep_no_argument(void) {
    puts("usage: grep [-abcDEFGHhIiJLlmnOoqRSsUVvwxZ] /"
         "[-A num] [-B num] [-C[num]]\n"
         "        [-e pattern] [-f file] [--binary-files=value]/"
         " [--color=when]\n"
         "        [--context[=num]] [--directories=action] /"
         "[--label] [--line-buffered]\n"
         "        [--null] [pattern] [file ...]");
    return 0;
}

int s21_grep_one_argument(char *arg[]) {
    if (s21_grep_flags(arg) == -1) {
        while (!feof(stdin)) {
            getchar();
        }
    } else {
        printf("%s", "usage: ");
        s21_grep_no_argument();
    } return 0;
}

int s21_grep_two_argument(int arg_number, char *arg[]) {
    if (s21_grep_flags(arg) == -1) {
        for (int i = 2; i < arg_number; i++) {
            s21_grep_flag_e(arg_number, arg, 1, i);
        }
    } else {
        while (!feof(stdin)) {
            getchar();
        }
    } return 0;
}

int s21_grep_no_file(char *arg[], int number_file) {
    printf("%s%s%s%s\n", "grep: ", arg[number_file], ": ", strerror(2));
    return 0;
}

int s21_grep_print(int arg_number, char *arg[]) {
    enum FLAGS grepFlags;
    switch (s21_grep_flags(arg)) {
        case 0:
            grepFlags = FLAG_E;
            break;
        case 1:
            grepFlags = FLAG_I;
            break;
        case 2:
            grepFlags = FLAG_V;
            break;
        case 3:
            grepFlags = FLAG_C;
            break;
        case 4:
            grepFlags = FLAG_L;
            break;
        case 5:
            grepFlags = FLAG_N;
            break;
        default:
            s21_grep_two_argument(arg_number, arg);
            grepFlags = -1;
    }
    for (int i = 3; i < arg_number; i++) {
        if (grepFlags == FLAG_E) {
            s21_grep_flag_e(arg_number, arg, 2, i);
        }
        if (grepFlags == FLAG_I) {
            s21_grep_flag_i(arg_number, arg, i);
        }
        if (grepFlags == FLAG_V) {
            s21_grep_flag_v(arg_number, arg, i);
        }
        if (grepFlags == FLAG_C) {
            s21_grep_flag_c(arg_number, arg, i);
        }
        if (grepFlags == FLAG_L) {
            s21_grep_flag_l(arg, i);
        }
        if (grepFlags == FLAG_N) {
            s21_grep_flag_n(arg_number, arg, i);
        }
    } return 0;
}
