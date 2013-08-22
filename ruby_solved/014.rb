# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

# method can be further memoized so that it remembers any chain it saw before
def collatz_seq(num)
  n = num
  answer = [num]
  while n > 1
    n.even?  ?  (n = n/2) : (n = 3*n + 1)
    answer << n
  end
  answer
end

num = 13
p collatz_seq(num)
p collatz_seq(num).size

start = Time.now

max = 1e6
longest_seq = [1]
(1...max).each do |i|
  puts "checking #{i}"
  current_seq = collatz_seq(i)
  longest_seq = current_seq if current_seq.size > longest_seq.size
end

puts (Time.now - start)

p longest_seq
p longest_seq[0]
p longest_seq.size
