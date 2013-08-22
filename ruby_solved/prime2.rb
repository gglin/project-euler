# To practice Ruby, we want to re-create the standard Ruby library for the Prime class

# require 'prime'

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

  def self.prime_division(num)
    answer = []
    factored_num = num

    (2..(num/2)).each do |factor|
      next if (factored_num % factor != 0)

      answer << [factor, 1]
      factored_num /= factor

      while factored_num > 1 && factored_num % factor == 0
        answer[-1][1] += 1
        return answer if factored_num == factor
        factored_num /= factor
      end

      return answer if factored_num == 1
    end

    # account for num = prime number
    return [[num, 1]] if factored_num == num
  end

  def self.divisors(num)
    factors = self.prime_division(num)
    factor_list = []
    answer = [1, num]
    # num_factors = factors.size

    # factors.each_with_index do |term, i|
    #   base1 = term[0]
    #   exp1  = term[1]
    #   (1..exp1).each do |exponent|
    #     powered1 = base1 ** exponent
    #     answer << powered1

    #     ((i+1)...num_factors).each do |j|
    #       base2 = factors[j][0]
    #       exp2  = factors[j][1]
    #       (1..exp2).each do |exponent|
    #         powered2 = base2 ** exponent
    #         answer << powered1 * powered2
    #       end
    #     end
    #   end
    # end
    
    factors.each do |term|
      base = term[0]
      exp  = term[1]
      exp.times { factor_list << base }
    end
    
    (1...factor_list.size).each do |len|
      answer += factor_list.combination(len).to_a.map { |combo| combo.reduce(:*) }
    end

    answer.sort.uniq
  end

  def self.proper_divisors(num)
    self.divisors(num)[0...-1]
  end

end

# p Prime2.divisors(32840334924)