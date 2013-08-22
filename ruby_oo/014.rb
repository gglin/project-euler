# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

# method can be further memoized so that it remembers any chain it saw before
class Collatz

  @@numbers = {}

  def self.all
    @@numbers
  end

  def initialize(num)
    @num = num
    self.class.all[num] = length2 # cache just the seq length not the sequence itself
  end

  def next_num(num)
    num.even?  ?  num/2  :  3*num + 1
  end

  # refactor
  def sequence
    x = @num
    answer = []
    while x != 1
      answer << x
      x = next_num(x)
    end
    answer << 1
  end

  # def length
  #   sequence.size
  # end

  def length2
    x = @num
    answer = 0
    while x != 1
      if self.class.all.has_key?(x)
        return answer + self.class.all[x]
      else
        answer += 1
        x = next_num(x)
      end
    end
    answer + 1
  end

end


x = Collatz.new(13)
p x.sequence
p x.length2

start = Time.now

max = 1e6
largest_num = 0
largest_length = 0
(1..max).each do |n|
  # Collatz.new(n)
  # p Collatz.all
  # puts n
  length = Collatz.new(n).length2
  if length > largest_length
    largest_num = n
    largest_length = length
  end
end

puts (Time.now - start)

# original non-OO version takes ~40 secs
# first OO version without memoization takes ~50 secs
# memoized version storing the actual sequence for each num takes ~90 secs
# memoized version storing just the sequence length for each num takes ~20 secs
#    without printing any numbers out this becomes ~8 secs

p Collatz.new(largest_num).sequence
p largest_length
p largest_num