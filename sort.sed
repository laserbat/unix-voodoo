#!/bin/sed -Ef
s/ /z/g;

:a
    s/(^|z)([^0bz][^bz]*)([^0bz])(0*)b?/\1\2\40b\3\4b/;
ta;


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
tb;

s/b//g;

:c
    s/(^|z)(a+)z(\2a+)($|z)/\1\3z\2\4/; tc;
    s/(^|z)(0)z(a+)($|z)/\1\3z\2\4/; tc;

s/$/q/;

:d
    s/^(.)(.*)q(.*)$/\2q\1\3/;
td;

s/q//;
s/^/z/;

:e
    s/z(a+)\1\1\1\1\1\1\1\1\1(a*)(q|z|$)/z\1q\2\3/;
te;

:f
    s/qq/q0q/g;
tf;

s/q($|z)/q0\1/g;

s/aaaaaaaaa/9/g;
s/aaaaaaaa/8/g;
s/aaaaaaa/7/g;
s/aaaaaa/6/g;
s/aaaaa/5/g;
s/aaaa/4/g;
s/aaa/3/g;
s/aa/2/g;
s/a/1/g;

s/q//g;
s/z//;
s/z/ /g;
