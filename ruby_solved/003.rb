# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

require_relative 'prime2'
require 'prime'
require 'benchmark'

# max = 1e6

# Prime.each(max) do |x|
#   puts x if x > max - 100
# end

num = 600851475143

p Prime.prime_division(num)
p Prime2.prime_division(num)


test_num = 60085147514334

Benchmark.bm do |x|
  x.report("Core      ")   { Prime.prime_division(test_num) }
  x.report("My Version")   { Prime2.prime_division(test_num) }
end