#!/usr/bin/bash

SRCDIR=https://raw.githubusercontent.com/houi-lin/cse101-pt.s20/master/pa3

curl $SRCDIR/ModelListTest.c > ModelListTest.c

echo ""
echo ""

rm -f *.o FindPath

echo ""

echo "Press Enter To Continue with ListTest Results"
read verbose

gcc -c -std=c99 -Wall -g ModelListTest.c List.c
gcc -o ModelListTest ModelListTest.o List.o

timeout 5 ./ModelListTest -v

echo ""
echo ""

rm -f *.o ModelListTest* ModelGraphTest* FindPath garbage

