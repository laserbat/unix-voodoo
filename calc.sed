#!/bin/sed -Ef
s/ //g;

p

:a
    s/(^|[^[:digit:]])([1-9][0-9]*)([1-9])(0*)b?/\1\2\40b\3\4b/;
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

p
:h
    s/(\([a+*]+\))\*(a+)([^a\)])/\(\1\*\2\)\3/g; p; th;
    s/(^|[^a])(a+)\*(a+)a($|[^a])/\1\(\2\+\(\2\*\3\)\)\4/g; p; th;
    s/a\*a([^a]|$)/a\1/g; p; th;
    s/(\()(a+)\+(a+)(\))/\1\2\3\4/g; p; th;
    s/\((a+)\)/\1/g; p; th;

    s/(^|[^a])(a+)\+(a+)($|[^a])/\1\2\3\4/g; p; th;

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
