# Problem 51: Prime digit replacements
# http://projecteuler.net/problem=51

#
# By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.
# Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.

require 'prime'
require_relative 'prime2'

# p prime_family(23,[0])
# p prime_family(56123,[2,3])


def combinations(num_digits)
  combos = []
  (1..num_digits).each do |len|
    combos += (0...num_digits).to_a.combination(len).to_a
  end
  combos
end

def prime_family_with_min_size(min)
i = 0

Prime.each do |prime|
  i += 1
  p prime if i % 1000 == 0

  if @num_digits != prime.to_s.size
    @num_digits = prime.to_s.size
    @combinations = combinations(@num_digits)
  end

  @combinations.each do |positions|
    family = Prime2.prime_family(prime, positions)
    if family.size >= 8
      p family
      return
    end
  end
end