# To practice Ruby, we want to re-create the standard Ruby library for the Prime class

require 'prime'

class Prime2
  
  def self.prime?(num)
    return false if !num.is_a? Integer
    return false if num < 2

    # We only need to loop through and check up to the square root of the number
    max_num_to_check = (num**0.5).floor

    (2..max_num_to_check).none? do |i|
      num % i == 0
    end
  end

  # recreate Prime.prime_division(num) but using hashes
  def self.prime_factors(num) 
    # takes a number and returns a hash, where each kvp is prime => exponent
    # find all possible prime factors of num
    possible_prime_factors = []
    Prime.each(num/2) do |x|
      possible_prime_factors << x
    end

    # find actual prime factors of num
    prime_factors = []
    possible_prime_factors.each do |x|
      prime_factors << x if num % x == 0
    end
    prime_factors.sort!

    # loop through and find exponents for each
    answer = []
    factored_num = num
    prime_factors.each do |pf|
      answer << [pf, 1]
      factored_num /= pf
      while factored_num % pf == 0
        answer[-1][1] += 1
        factored_num /= pf
      end
    end
    answer << [num, 1] if Prime2.prime?(num)

    Hash[*answer.flatten]
  end

end