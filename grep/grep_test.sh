#!/bin/bash

test1_file=../../README.md
test2_file=./test.file
test3_file=./text.file
success_tests=0
fail_tests=0

#  Test1

  echo "Test1: grep README.md test.file"

  grep_result=$(grep $test1_file $test2_file)
  s21_grep_result=$(./s21_grep $test1_file $test2_file)

#  echo "Grep result: $grep_result"
#  echo "s21_grep result: $s21_grep_result"

  if [ "$grep_result" = "$s21_grep_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi


#  Test2

  echo "Test2: grep _grep README.md test.file"

  grep_result=$(grep _grep $test1_file $test2_file)
  s21_grep_result=$(./s21_grep _grep $test1_file $test2_file)

#  echo "Grep result: $grep_result"
#  echo "s21_grep result: $s21_grep_result"

  if [ "$grep_result" = "$s21_grep_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#  Test3

  echo "Test3: grep -e Cat README.md test.file"

  grep_result=$(grep -e Cat $test1_file $test2_file)
  s21_grep_result=$(./s21_grep -e Cat $test1_file $test2_file)

#  echo "Grep result: $grep_result"
#  echo "s21_grep result: $s21_grep_result"

  if [ "$grep_result" = "$s21_grep_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#  Test4

  echo "Test4: grep -i Au README.md test.file"

  grep_result=$(grep -i Au $test1_file $test2_file)
  s21_grep_result=$(./s21_grep -i Au $test1_file $test2_file)

#  echo "Grep result: $grep_result"
#  echo "s21_grep result: $s21_grep_result"

  if [ "$grep_result" = "$s21_grep_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#  Test5

  echo "Test5: grep -v le README.md test.file"

  grep_result=$(grep -v le $test1_file $test2_file)
  s21_grep_result=$(./s21_grep -v le $test1_file $test2_file)

#  echo "Grep result: $grep_result"
#  echo "s21_grep result: $s21_grep_result"

  if [ "$grep_result" = "$s21_grep_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#  Test6

  echo "Test6: grep -c t README.md test.file"

  grep_result=$(grep -c \| $test1_file $test2_file)
  s21_grep_result=$(./s21_grep -c \| $test1_file $test2_file)

#  echo "Grep result: $grep_result"
#  echo "s21_grep result: $s21_grep_result"

  if [ "$grep_result" = "$s21_grep_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#  Test7

  echo "Test7: grep -l 3 README.md test.file text.file"

  grep_result=$(grep -l 3 $test1_file $test2_file $test3_file)
  s21_grep_result=$(./s21_grep -l 3 $test1_file $test2_file $test3_file)

#  echo "Grep result: $grep_result"
#  echo "s21_grep result: $s21_grep_result"

  if [ "$grep_result" = "$s21_grep_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

#  Test8

  echo "Test8: grep -n : README.md test.file"

  grep_result=$(grep -n : $test1_file $test2_file)
  s21_grep_result=$(./s21_grep -n : $test1_file $test2_file)

#  echo "Grep result: $grep_result"
#  echo "s21_grep result: $s21_grep_result"

  if [ "$grep_result" = "$s21_grep_result" ];
  then echo "Success"
  success_tests=$((success_tests + 1))
  else echo -e "Fail\n"
  fail_tests=$((fail_tests + 1))
  fi

  echo "Success test: $success_tests"
  echo "Fail test: $fail_tests"