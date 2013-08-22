# The sum of the squares of the first ten natural numbers is,

# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.


def sum_of_squares(num)
  (1..num).reduce {|sum, i| sum + i**2}
end

def square_of_sums(num)
  (1..num).reduce(:+) ** 2
end

puts sum_of_squares(10)
puts square_of_sums(10)

puts x = sum_of_squares(100)
puts y = square_of_sums(100)

puts x - y