#!/bin/bash

test1_file=./FILE0.file
test2_file=./text.txt
success_tests=0
fail_tests=0

#  Test1
  echo "Test1: cat test1.file"

  cat_result=$(cat $test1_file)
  s21_cat_result=$(./s21_cat $test1_file)

#  echo "Cat result: $cat_result"
#  echo "s21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test2

  echo "Test2: cat test1.file test2.filee"

  cat_result=$(cat $test1_file $test2_file)
  s21_cat_result=$(./s21_cat $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test3

  echo "Test3: cat -b test1.file test2.file"

  cat_result=$(cat -b $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -b $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test4

  echo "Test4: cat -e test1.file test2.file"

  cat_result=$(cat -e $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -e $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

   if [ "$cat_result" = "$s21_cat_result" ];
   then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
   fi

#Test5

  echo "Test5: cat -n test1.file test2.file"

  cat_result=$(cat -n $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -n $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi



# Test6

  echo "Test6: cat -s test1.file test2.file"

  cat_result=$(cat -s $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -s $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test7

  echo "Test7: cat -t test1.file test2.file"

  cat_result=$(cat -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi



#Test8

  echo "Test8: cat -b -e test1.file test2.file"

  cat_result=$(cat -b -e $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -b -e $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test9

  echo "Test9: cat -b -s test1.file test2.file"

  cat_result=$(cat -b -s $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -b -s $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

  #Test10

    echo "Test10: cat -b -t test1.file test2.file"

    cat_result=$(cat -b -t $test1_file $test2_file)
    s21_cat_result=$(./s21_cat -b -t $test1_file $test2_file)

  #  echo "Cat result: $cat_result"
  #  echo "S21_cat result: $s21_cat_result"

    if [ "$cat_result" = "$s21_cat_result" ];
    then echo "Success"
    success_tests=$((success_tests + 1))
    else echo -e "Fail\n"
    fail_tests=$((fail_tests + 1))
    fi

#Test11

  echo "Test11: cat -e -n test1.file test2.file"

  cat_result=$(cat -e -n $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -e -n $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi


#Test12

  echo "Test12: cat -e -s test1.file test2.file"

  cat_result=$(cat -e -s $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -e -s $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test13

  echo "Test13: cat -e -t test1.file test2.file"

  cat_result=$(cat -e -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -e -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test14

  echo "Test14: cat -n -s test1.file test2.file"

  cat_result=$(cat -n -s $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -n -s $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test15

  echo "Test15: cat -n -t test1.file test2.file"

  cat_result=$(cat -n -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -n -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test16

  echo "Test16: cat -s -t test1.file test2.file"

  cat_result=$(cat -s -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -s -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test17

  echo "Test17: cat -b -e -n test1.file test2.file"

  cat_result=$(cat -b -e -n $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -b -e -n $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test18

  echo "Test18: cat -b -e -s test1.file test2.file"

  cat_result=$(cat -b -e -s $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -b -e -s $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test19

  echo "Test19: cat -b -e -t test1.file test2.file"

  cat_result=$(cat -b -e -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -b -e -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi



#Test20

  echo "Test20: cat -b -s -t test1.file test2.file"

  cat_result=$(cat -b -s -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -b -s -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi


#Test21

  echo "Test21: cat -e -n -s test1.file test2.file"

  cat_result=$(cat -e -n -s $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -e -n -s $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test22

  echo "Test22: cat -e -n -t test1.file test2.file"

  cat_result=$(cat -e -n -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -e -n -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test23

  echo "Test23: cat -e -s -t test1.file test2.file"

  cat_result=$(cat -e -s -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -e -s -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi


#Test24

  echo "Test24: cat -n -s -t test1.file test2.file"

  cat_result=$(cat -n -s -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -n -s -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test25

  echo "Test25: cat -b -e -n -s test1.file test2.file"

  cat_result=$(cat -b -e -n -s $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -b -e -n -s $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi


#Test26

  echo "Test26: cat -e -n -s -t test1.file test2.file"

  cat_result=$(cat -e -n -s -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -e -n -s -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test27

  echo "Test27: cat -b -e -s -t test1.file test2.file"

  cat_result=$(cat -b -e -s -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -b -e -s -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test28

  echo "Test28: cat -b -e -n -t test1.file test2.file"

  cat_result=$(cat -b -e -n -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -b -e -n -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test29

  echo "Test29: cat -b -e -n -s -t test1.file test2.file"

  cat_result=$(cat -b -e -n -s -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -b -e -n -s -t $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test30

  echo "Test30: cat --number-nonblank test1.file test2.file"

  cat_result=$(cat -b $test1_file $test2_file)
  s21_cat_result=$(./s21_cat --number-nonblank $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test31

  echo "Test31: cat -E test1.file test2.file"

  cat_result=$(cat -e $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -E $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test32

  echo "Test32: cat --number test1.file test2.file"

  cat_result=$(cat -n $test1_file $test2_file)
  s21_cat_result=$(./s21_cat --number $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test33

  echo "Test33: cat --squeeze-blank test1.file test2.file"

  cat_result=$(cat -s $test1_file $test2_file)
  s21_cat_result=$(./s21_cat --squeeze-blank $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#Test34

  echo "Test34: cat -T test1.file test2.file"

  cat_result=$(cat -t $test1_file $test2_file)
  s21_cat_result=$(./s21_cat -T $test1_file $test2_file)

#  echo "Cat result: $cat_result"
#  echo "S21_cat result: $s21_cat_result"

  if [ "$cat_result" = "$s21_cat_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

  echo "Success test: $success_tests"
  echo "Fail test: $fail_tests"