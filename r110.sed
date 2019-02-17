#!/bin/sed -Ef

:start

# Padding
s/(^|$)/0/g; 

# Turn list of cells into groups of neighbors
# abcde -> abc bcd cde

s/^/;/g; 

# Iteratively split  the line into groups
:loop
s/^(.*;)(.)(..)(.+)$/\1\2\3;\3\4/;
s/;(...)/ \1/;
t loop;

# Description of rule 110
# 111 100 000 becomes 0, everything else 1
s/(111|100|000)/0/g;
s/[^ ]{3}/1/g;

# Remove spaces added in the process
s/ //g;

p;
b start;
