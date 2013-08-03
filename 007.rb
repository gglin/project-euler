# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?

require_relative 'prime2'

x = 1
num = 2

until x > 10001
  if Prime2.prime?(num)
    puts num
    x += 1
  end

  num += 1
end


