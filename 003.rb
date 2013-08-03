# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

require 'prime'
require_relative 'prime2'

p Prime.prime_division(600851475143)
p Prime2.prime_factors(600851475143)