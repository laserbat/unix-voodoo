#!/bin/sed -Ef
:a

s/((.)(.+))((.)(.))(.{63})/&!\3\4\7\2!\7\1\4!\6\7\1\5!\4\7\1/
s/((.{63})(.))((.)(\w+))(\w).*/&!\7\1\4!\3\4\7\2!\4\7\1!\6\7\1\5!/

:b
s/(\w)(\w*!)(.*!)(.*)/\3\2\4\1/
tb

s/(\w)(.{8})/ \1:\2 /g
s/0|!//g

s/ :111 | 1:111? /1/g
s/ \S+ /0/g

h
x
y/01/.#/
s/.{64}/&\n/g
s/$/\n/p
x

ba
