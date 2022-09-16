//  Copyright 2022 michaleh

#include <stdio.h>
#include <string.h>
#include <stddef.h>

#define SIZE 10000

enum FLAG_B {flag_b_on, flag_b_off} flagB;
enum FLAG_E {flag_e_on, flag_e_off} flagE;
enum FLAG_N {flag_n_on, flag_n_off} flagN;
enum FLAG_S {flag_s_on, flag_s_off} flagS;
enum FLAG_T {flag_t_on, flag_t_off} flagT;
enum FLAG_V {flag_v_on, flag_v_off} flagV;


int s21_cat_flags(int arg_number, char *arg[]);
int s21_cat_print(int flag_number, char *flags[]);
int s21_cat_flag_b(char *arg[], int i);
int s21_cat_flag_e(char *arg[], int i);
int s21_cat_flag_n(char *arg[], int i);
int s21_cat_flag_s(char *arg[], int i);
int s21_cat_flag_t(char *arg[], int i);
int s21_cat_flag_v(char line);


int main(int arg_number, char *arg[]) {
    flagB = flag_b_off;
    flagE = flag_e_off;
    flagN = flag_n_off;
    flagS = flag_s_off;
    flagT = flag_t_off;
    flagV = flag_v_off;
    s21_cat_print(arg_number, arg);
    return 0;
}



int s21_cat_print(int arg_number, char *arg[]) {
    FILE *file;
    unsigned int n = 1;
    int i;
    char c;
    int number_flags = 0;
    int symbol = 0;
    number_flags = s21_cat_flags(arg_number, arg);
    for (i = (number_flags + 1); i < arg_number; i++) {
        if ((file = fopen(arg[i], "r")) == NULL) {
            printf("%s%s%s%s\n", "cat: ", arg[i], ": ", strerror(2));;
        } else {
            c = fgetc(file);
            while (!feof(file)) {
                if ((flagB == flag_b_on || flagN == flag_n_on) && symbol == 0 && c != '\n') {
                    printf("%6u\t", n);
                    n++;
                } else if (flagN == flag_n_on && flagB != flag_b_on && symbol == 0) {
                    printf("%6u\t", n);
                    n++;
                } else if (flagN == flag_n_on && flagB == flag_b_on && symbol == 0 && flagE != flag_e_on) {
                    printf("%6c\t", ' ');
                }
                if (flagS == flag_s_on && symbol == 0 && c == '\n') {
                    do {
                        c = fgetc(file);
                    } while (c == '\n');
                    if (flagE == flag_e_on) {
//                        if (flagB == flag_b_on && flagN != flag_n_on) {
//                            printf("%6c\t%c\n", ' ', '$');
//                        } else {
                            printf("%s", "$");
//                        }
                    }
                    if (flagB == flag_b_on || flagN == flag_n_on) {
                        printf("\n%6u\t", n);
                        n++;
                    } else {
                        puts("");
                    }
                }
                if ((flagE == flag_e_on || flagT == flag_t_on || flagV == flag_v_on) \
                    && c != '\n' && c != '\t') {
                    int k = (int)c;
                    if (k >= -128 && k < -96) {
                        printf("%s%c%c", "M-", '^', k + 128 + 64);
                        if ((flagB == flag_b_on || flagN == flag_n_on) && k == -118) {
                            printf("%6u\t", n);
                            n++;
                        }
                    } else if (c >= 0 && c < 32) {
                        printf("%c%c", '^', c + 64);
                    } else if (c == 127) {
                        printf("%c%c", '^', '?');
                    } else {
                        printf("%c", c);
                    }
                } else if (flagT == flag_t_on && c == '\t') {
                    printf("%c%c", '^', 'I');
                } else if (flagT == flag_t_on && c == '\n' && flagE != flag_e_on) {
                    puts("");
                } else if (flagE == flag_e_on && c == '\n') {
//                    if (flagB == flag_b_on && flagN != flag_n_on && symbol == 0) {
//                        printf("%6c\t%c\n", ' ', '$');
//                    } else {
                        puts("$");
//                    }
                } else if (flagE == flag_e_on && c == '\t') {
                    printf("%c", '\t');
                }
                if (!(flagE == flag_e_on || flagT == flag_t_on || flagV == flag_v_on)) {
                    printf("%c", c);
                }
                symbol++;
                if (c == '\n') {
                    symbol = 0;
                }
                c = fgetc(file);
            }
        }
        fclose(file);
        n = 1;
        symbol = 0;
    }
    return 0;
}


int s21_cat_flags(int arg_number, char *arg[]) {
    int number_flags = 11;
    int equal;
    int i, j;
    int n = 0;
    const char *flag_b = "-b";
    const char *flag_e = "-e";
    const char *flag_n = "-n";
    const char *flag_s = "-s";
    const char *flag_t = "-t";
    const char *flag_v = "-v";
    const char *flag_b_gnu = "--number-nonblank";
    const char *flag_e_gnu = "-E";
    const char *flag_n_gnu = "--number";
    const char *flag_s_gnu = "--squeeze-blank";
    const char *flag_t_gnu = "-T";
    const char *flags[] = {flag_b, flag_b_gnu, flag_e, flag_e_gnu, flag_n, \
    flag_n_gnu, flag_s, flag_s_gnu, flag_t, flag_t_gnu, flag_v};

    for (i = 1; i < arg_number; i++) {
        for (j = 0; j < number_flags; j++) {
            equal = strcoll(arg[i], flags[j]);
            if (equal == 0) {
                switch (j) {
                    case 0:
                    case 1:
                        flagB = flag_b_on;
                        n++;
                        break;
                    case 2:
                    case 3:
                        flagE = flag_e_on;
                        n++;
                        break;
                    case 4:
                    case 5:
                        flagN = flag_n_on;
                        n++;
                        break;
                    case 6:
                    case 7:
                        flagS = flag_s_on;
                        n++;
                        break;
                    case 8:
                    case 9:
                        flagT = flag_t_on;
                        n++;
                        break;
                    case 10:
                        flagV = flag_v_on;
                        n++;
                        break;
                }
            }
        }
        if (n == 0) {
            break;
        }
    } return n;
}
