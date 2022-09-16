//  Copyright 2022 michaleh

#include "./s21_grep.h"

int s21_grep_flags(char *arg[]) {
    int number_flags = 6;
    int equal;
    int number_of_flag = -1;
    const char *flag_e = "-e";
    const char *flag_i = "-i";
    const char *flag_v = "-v";
    const char *flag_c = "-c";
    const char *flag_l = "-l";
    const char *flag_n = "-n";
    const char *flags[6] = {flag_e, flag_i, flag_v, flag_c, flag_l, flag_n};

    for (int i = 0; i < number_flags; i++) {
        equal = strcoll(arg[1], flags[i]);
        if (equal == 0) {
            number_of_flag = i;
            break;
        }
    } return number_of_flag;
}

int s21_grep_flag_e(int arg_number, char *arg[], int number_expression, \
    int number_file) {
    regex_t string;
    int result;
    FILE *file;
    char line[10000];

    if ((file = fopen(arg[number_file], "r")) == NULL) {
        s21_grep_no_file(arg, number_file);
    } else {
        result = regcomp(&string, arg[number_expression], 0);
        if (result) {
            fprintf(stderr, "Could not compile regex\n");
        }
        while (!feof(file)) {
            if (fgets(line, 10000, file)) {
                result = regexec(&string, line, 0, NULL, 0);
                if (!result) {
                    if ((arg_number - number_expression) > 2) {
                        printf("%s:", arg[number_file]);
                    }
                    printf("%s", line);
                }
            }
        }
        fclose(file);
        regfree(&string);
    }
    return 0;
}

int s21_grep_flag_i(int arg_number, char *arg[], int number_file) {
    regex_t string;
    int result;
    FILE *file;
    char line[10000];

    if ((file = fopen(arg[number_file], "r")) == NULL) {
        s21_grep_no_file(arg, number_file);
    } else {
        result = regcomp(&string, arg[2], REG_ICASE);
        if (result) {
            printf("%s\n", "Could not compile regex");
        }
        while (!feof(file)) {
            if (fgets(line, 10000, file)) {
                result = regexec(&string, line, 0, NULL, 0);
                if (!result) {
                    if ((arg_number - 2) > 2) {
                        printf("%s:", arg[number_file]);
                    }
                    printf("%s", line);
                }
            }
        } fclose(file);
        regfree(&string);
    }
    return 0;
}

int s21_grep_flag_v(int arg_number, char *arg[], int number_file) {
    regex_t string;
    int result;
    FILE *file;
    char line[10000];

    if ((file = fopen(arg[number_file], "r")) == NULL) {
        s21_grep_no_file(arg, number_file);
    } else {
        result = regcomp(&string, arg[2], 0);
        if (result) {
            printf("%s\n", "Could not compile regex");
        }
        while (!feof(file)) {
            if (fgets(line, 10000, file)) {
                result = regexec(&string, line, 0, NULL, 0);
                if (result) {
                    if ((arg_number - 2) > 2) {
                        printf("%s:", arg[number_file]);
                    }
                    printf("%s", line);
                }
            }
        }fclose(file);
        regfree(&string);
    }
    return 0;
}

int s21_grep_flag_c(int arg_number, char *arg[], int number_file) {
    regex_t string;
    int result;
    FILE *file;
    char line[10000];
    int number_of_lines = 0;

    if ((file = fopen(arg[number_file], "r")) == NULL) {
        s21_grep_no_file(arg, number_file);
    } else {
        result = regcomp(&string, arg[2], 0);
        if (result) {
           printf("%s\n", "Could not compile regex");
        }
        while (!feof(file)) {
            if (fgets(line, 10000, file)) {
                result = regexec(&string, line, 0, NULL, 0);
                if (!result) {
                    number_of_lines++;
                }
            }
        }
        if ((arg_number - 2) > 2) {
            printf("%s:", arg[number_file]);
        } printf("%d\n", number_of_lines);
        fclose(file);
        regfree(&string);
    }
    return 0;
}

int s21_grep_flag_l(char *arg[], int number_file) {
    regex_t string;
    int result = 0;
    FILE *file;
    char line[10000];
    int option = 0;

    if ((file = fopen(arg[number_file], "r")) == NULL) {
        s21_grep_no_file(arg, number_file);
    } else {
        result = regcomp(&string, arg[2], 0);
        if (result) {
            printf("%s\n", "Could not compile regex");
        }
        while (!feof(file)) {
            if (fgets(line, 10000, file)) {
                result = regexec(&string, line, 0, NULL, 0);
                if (!result) {
                    printf("%s\n", arg[number_file]);
                    option = 1;
                    result = 0;
                    break;
                }
            }
        } fclose(file);
        regfree(&string);
    }
    return option;
}

int s21_grep_flag_n(int arg_number, char *arg[], int number_file) {
    regex_t string;
    int result;
    FILE *file;
    char line[10000];
    int number_of_lines = 0;

    if ((file = fopen(arg[number_file], "r")) == NULL) {
        s21_grep_no_file(arg, number_file);
    } else {
        result = regcomp(&string, arg[2], 0);
        if (result) {
            printf("%s\n", "Could not compile regex");
        }
        while (!feof(file)) {
            if (fgets(line, 10000, file)) {
                result = regexec(&string, line, 0, NULL, 0);
                number_of_lines++;
                if (!result) {
                    if ((arg_number - 2) > 2) {
                        printf("%s:", arg[number_file]);
                    }
                    printf("%d:%s", number_of_lines, line);
                }
            }
        } fclose(file);
        regfree(&string);
    }
    return 0;
}
