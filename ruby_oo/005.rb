# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

require_relative 'prime2'
require 'prime'
require 'benchmark'

def lcm_stupid(max) # this way is not good ... takes too long
  answer = max
  found = false

  until found
    puts "checking #{answer}..."
    every_number_divisible = true

    (2..max).each do |num|
      if answer % num != 0
        every_number_divisible = false
      end
    end

    if every_number_divisible
      found = true
      return answer
    end
    answer += 1
  end
end
# p factors = Prime2.prime_division(60)


def product_of_factorization(prime_factors)
  answer = 1
  prime_factors.each do |prime, exponent|
    answer *= prime**exponent
  end
  answer
end
# p product_of_factorization(factors)


(2..20).each do |x|
  # p Prime.prime_division(x)
  p Prime2.prime_division(x)
end


def lcm(max)
  prime_factors_needed = {}

  (2..max).each do |num|
    prime_factors_needed.merge!( Hash[*Prime2.prime_division(num).flatten] ) do |prime, oldexp, newexp|
      [oldexp, newexp].max
    end
  end
  # p prime_factors_needed

  product_of_factorization(prime_factors_needed)
end

n = 20
p lcm(n)
#=> 232,792,560
p (1..n).reduce(:lcm) 



# benchmark vs built-in method
test_num = 1723

Benchmark.bm do |x|
  x.report("My Version")   { lcm(test_num) }
  x.report("Core LCM  ")   { (1..test_num).reduce(:lcm) }
end

