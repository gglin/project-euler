# The following iterative sequence is defined for the set of positive integers:
 
# n ->n/2 (n is even) n ->3n + 1 (n is odd)
 
# Using the rule above and starting with 13, we generate the following sequence:
 
# 13 40 20 10 5 16 8 4 2 1 It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
 
# Which starting number, under one million, produces the longest chain?

class Collatz

  # use class variables
  @@numbers = {}

  def self.all
    @@numbers
  end

  def initialize(num)
    @num = num
    self.class.all[num] = sequence
  end

  def next_num(num)
    num%2==0  ?  num/2  :  3*num + 1
  end

  # refactor
  def sequence
    x = @num
    answer = []
    while x != 1
      if self.class.all.has_key?(x)
        return answer + self.class.all[x]
      else
        answer << x
        x = next_num(x)
      end
    end
    answer << 1
  end

  def length
    sequence.size
  end

end


# x = Collatz.new(13)
# p x.sequence
# p x.length

start = Time.now

max = 1e6
largest_num = 0
largest_length = 0
(1..max).each do |n|
  # Collatz.new(n)
  # p Collatz.all
  puts n
  length = Collatz.new(n).length
  if length > largest_length
    largest_num = n
    largest_length = length
  end
end

puts (Time.now - start)

p largest_length
p largest_num