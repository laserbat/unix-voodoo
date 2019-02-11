# Unix Voodoo

Basically a bunch of small scripts that make use of various tools common on unix systems (shell, sed, bc) to do surprising things

calc.sed
---

Simple calculator that can sum, multiply and parse parenthesis:

    > echo "(6 + (77 + 2 * 3)) * 14" | ./calc.sed 
    1246 

It doesn't (yet) work with zeros.

prime.sed
---

Prime checker. It's really slow, but it works :)

    > echo 43 | ./prime.sed
    true

sort.sed
---

Numeric sorting

    > echo 1 7 667 35 2 0 37 4 | ./sort.sed 
    0 1 2 4 7 35 37 667

cp.sh
---
Implementation of `cp` using pure bash. It works on binary files too!

    ./cp.sh a b

mandelbrot.bc
---

Straightforward program to draw mandelbrot set. Nothing really special.
