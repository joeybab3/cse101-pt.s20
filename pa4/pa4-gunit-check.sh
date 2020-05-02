#!/usr/bin/bash

SRCDIR=https://raw.githubusercontent.com/houi-lin/cse101-pt.s20/master/pa4

if [ ! -e backup ]; then
  mkdir backup
fi

cp *.c *.h Makefile backup   # copy all files of importance into backup

curl $SRCDIR/ModelGraphTest.c > ModelGraphTest.c

echo ""
echo ""

rm -f *.o FindComponents

echo "Press Enter To Continue with GraphTest Results"
read verbose

echo ""
echo ""

gcc -c -std=c99 -Wall -g ModelGraphTest.c Graph.c List.c
gcc -o ModelGraphTest ModelGraphTest.o Graph.o List.o

timeout 6 valgrind --leak-check=full -v ./ModelGraphTest -v > GraphTest-out.txt 2> GraphTest-mem.txt

cat GraphTest-mem.txt
cat GraphTest-out.txt

rm -f *.o ModelListTest* ModelGraphTest* FindComponents garbage GraphTest-mem.txt GraphTest-out.txt

