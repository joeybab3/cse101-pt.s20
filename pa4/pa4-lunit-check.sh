#!/usr/bin/bash

SRCDIR=https://raw.githubusercontent.com/houi-lin/cse101-pt.s20/master/pa4

if [ ! -e backup ]; then
  mkdir backup
fi

cp *.c *.h Makefile backup   # copy all files of importance into backup

curl $SRCDIR/ModelListTest.c > ModelListTest.c

echo ""
echo ""

rm -f *.o FindComponents

echo ""

echo "Press Enter To Continue with ListTest Results"
read verbose

gcc -c -std=c99 -Wall -g ModelListTest.c List.c
gcc -o ModelListTest ModelListTest.o List.o

timeout 6 valgrind --leak-check=full -v ./ModelListTest -v > ListTest-out.txt 2> ListTest-mem.txt

cat ListTest-out.txt

rm -f *.o ModelListTest* ModelGraphTest* FindComponents garbage ListTest-out.txt ListTest-mem.txt

