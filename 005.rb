# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

require_relative 'prime2'
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


factors = Prime2.prime_factors(60)
p factors


def product_of_factorization(prime_factors)
  answer = 1
  prime_factors.each do |prime, exponent|
    answer *= prime**exponent
  end
  answer
end
p product_of_factorization(factors)


def lcm(max)
  prime_factors_needed = {}

  (2..max).each do |num|
    prime_factors_needed.merge!( Prime2.prime_factors(num) ) do |prime, oldexp, newexp|
      [oldexp, newexp].max
    end
  end
  # p prime_factors_needed

  product_of_factorization(prime_factors_needed)
end

n = 20
p lcm(n)
#=> 232,792,560
p (1..n).inject(:lcm) 



# benchmark vs built in method
test_num = 1723

# their_start = Time.now
# p (1..test_num).inject(:lcm)
# their_stop = Time.now


# mine_start = Time.now
# p lcm(test_num)
# mine_stop = Time.now


# their_duration = their_stop - their_start
# mine_duration  = mine_stop  - mine_start

# p "For the test num #{test_num},"
# p "Theirs took #{their_duration} s"
# p "Mine took #{mine_duration} s"



Benchmark.bm do |x|
  x.report("My Version")   { lcm(test_num) }
  x.report("Core LCM  ")   { (1..test_num).inject(:lcm) }
end
