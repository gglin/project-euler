# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require_relative 'prime2'

def perfect_compare(num)
  # -1 is deficient, 0 is perfect, 1 is abundant
  Prime2.proper_divisors(num).reduce(:+) <=> num
end

max = 28123
perfect = []
abundant = []

puts "Finding abundants..."
(1..max).each do |i|
  pc = perfect_compare(i)
  # puts "#{i}: #{pc}"
  perfect  << i if pc == 0
  abundant << i if pc == 1
end

p perfect
p perfect.size
p size = abundant.size
p abundant.include?(max)

abundant_sums = []

puts "Finding all pairs..."
# loop through all pairs of abundant numbers less than max
(0...size).each do |i|
  (0...size).each do |j|
    sum = abundant[i] + abundant[j]
    abundant_sums << sum if sum <= max
  end
end

abundant_sums.sort!.uniq!
non_abundant_sums = (1..max).to_a - abundant_sums
p non_abundant_sums
p non_abundant_sums.size
p non_abundant_sums.reduce(:+)

