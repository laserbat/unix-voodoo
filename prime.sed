#!/bin/sed -Ef
:a
    s/^([^0b][^b]*)([^0b])(0*)b?/\1\30b\2\3b/;
t a;

s/^0+b//;

s/1/a/g;
s/2/aa/g;
s/3/aaa/g;
s/4/aaaa/g;
s/5/aaaaa/g;
s/6/aaaaaa/g;
s/7/aaaaaaa/g;
s/8/aaaaaaaa/g;
s/9/aaaaaaaaa/g;

:b
    s/(a+)0/\1\1\1\1\1\1\1\1\1\1/g;
t b;

s/b//g;

s/^(0|a)$/false/;
s/^(aa+)\1+$/false/;s/^a+$/true/
