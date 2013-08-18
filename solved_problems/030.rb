# Problem 30: Digit fifth powers
# http://projecteuler.net/problem=30

# 
# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 1^4 is not a sum it is not included.
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

power = 5

def sum_of_powers(num, power)
  num.to_s.each_char.map { |c| c.to_i ** power }.reduce(:+)
end


# calculate largest number to check up to
n = 0

begin
  n += 1
  max_to_check = 9**power * n
  largest_num  = n.times.map{"9"}.join.to_i
end while max_to_check > largest_num

puts n
puts max_to_check


# calculate answer
answers = []

1.upto(max_to_check) do |i|
  sp = sum_of_powers(i, power)
  answers << i if i == sp
end

p answers
p answers.reduce(:+) - 1