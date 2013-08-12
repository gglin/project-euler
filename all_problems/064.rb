# Problem 64: Odd period square roots
# http://projecteuler.net/problem=64

# All square roots are periodic when written as continued fractions and can be written in the form:
# 
# N = a0 +
# 1
#  
# a1 +
# 1
#  
#  
# a2 +
# 1
#  
#  
#  
# a3 + ...
# 
# For example, let us consider 23:
# 
# 23 = 4 + 23 — 4 = 4 + 
# 1
#  = 4 + 
# 1
#  
# 123—4
#  
# 1 + 
# 23 – 37
# 
# If we continue we would get the following expansion:
# 
# 23 = 4 +
# 1
#  
# 1 +
# 1
#  
#  
# 3 +
# 1
#  
#  
#  
# 1 +
# 1
#  
#  
#  
#  
# 8 + ...
# 
# The process can be summarised as follows:
# 
# a0 = 4,
#  
# 123—4
#  = 
# 23+47
#  = 1 + 
# 23—37
# a1 = 1,
#  
# 723—3
#  = 
# 7(23+3)14
#  = 3 + 
# 23—32
# a2 = 3,
#  
# 223—3
#  = 
# 2(23+3)14
#  = 1 + 
# 23—47
# a3 = 1,
#  
# 723—4
#  = 
# 7(23+4)7
#  = 8 + 
# 23—4
# a4 = 8,
#  
# 123—4
#  = 
# 23+47
#  = 1 + 
# 23—37
# a5 = 1,
#  
# 723—3
#  = 
# 7(23+3)14
#  = 3 + 
# 23—32
# a6 = 3,
#  
# 223—3
#  = 
# 2(23+3)14
#  = 1 + 
# 23—47
# a7 = 1,
#  
# 723—4
#  = 
# 7(23+4)7
#  = 8 + 
# 23—4
# 
# It can be seen that the sequence is repeating. For conciseness, we use the notation 23 = [4;(1,3,1,8)], to indicate that the block (1,3,1,8) repeats indefinitely.
# 
# The first ten continued fraction representations of (irrational) square roots are:
# 2=[1;(2)], period=13=[1;(1,2)], period=25=[2;(4)], period=16=[2;(2,4)], period=27=[2;(1,1,1,4)], period=48=[2;(1,4)], period=210=[3;(6)], period=111=[3;(3,6)], period=212= [3;(2,6)], period=213=[3;(1,1,1,1,6)], period=5
# Exactly four continued fractions, for N  13, have an odd period.
# How many continued fractions for N  10000 have an odd period?

