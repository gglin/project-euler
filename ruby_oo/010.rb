# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

require_relative 'prime2'
require 'prime'
require 'benchmark'

def sum_primes_below2(num)
  sum = 0
  (2...num).each do |i|
    if Prime2.prime?(i)
      puts i
      sum += i
    end
  end
  sum
end

def sum_primes_below(num)
  sum = 0
  (2...num).each do |i|
    if Prime.prime?(i)
      # puts i
      sum += i
    end
  end
  sum
end

test_num = 2e5

Benchmark.bm do |x|
  x.report("My Version")   { sum_primes_below2(test_num) }
  x.report("Core      ")   { sum_primes_below( test_num) }
end
# My version is better than core :)

num = 2e6
puts sum_primes_below2(num)