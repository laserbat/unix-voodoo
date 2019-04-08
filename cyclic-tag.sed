#!/bin/sed -Ef
# This regular expression simulates one step of a cyclic-tag system
# When applied in a loop it simulates turing-complete computation 

# Input: word!rule1!rule2!...!ruleN!1:rule1!0:
# Where word and each rule* is a string of 0 or more 1s and 0s
# While the last part (1:rule1!0:) isn't necessary to describe a CT system,
# it is necessary for computation.

# Suppose you want to simulate a cyclic tag system with production rules 
# (010, 000, 1111), and initial word 11001
# To do this, you need to format input string like this:

#                      |--- rule1
#       rules 1 - 3    v
# 11001!010!000!1111!1:010!0:
# ^
# |--- word

# Computation halts once 'word' becomes empty.

:a s/^(\w)(\w*)!(\w*)!(\w*)!([^:]*)!.*\1:(\w*).*/\2\6!\4!\5!\3!1:\4!0:/p
ta
