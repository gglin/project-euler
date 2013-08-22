# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

require_relative 'prime2'
require 'facets'

def d(n)
  Prime2.proper_divisors(n).reduce(:+)
end

max = 10000
all = []

(2..max).each do |n|
  all << [n, d(n)]
end

potentials = all.map(&:sort).sort.reject {|a| a[0]==a[1]}

raise unless  potentials.frequency.select {|k,v| v > 2}.empty?
p amicables = potentials.frequency.select {|k,v| v > 1}.keys
p amicables.size

p amicables.flatten.reduce(:+)