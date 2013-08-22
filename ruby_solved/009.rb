# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def is_pythagorean_triplet?(x, y, z)
  return false if (x == y || y == z || x == z)
  sorted = [x, y, z].sort!
  a, b, c = sorted
  a**2 + b**2 == c**2
end

puts is_pythagorean_triplet?(3, 4, 5)
puts is_pythagorean_triplet?(3, 4, 6)
puts is_pythagorean_triplet?(5, 12, 13)

def find_pythagorean_triplet_from_sum(sum)
  (1..(sum-2)).each do |x|
    (1..(sum-x-1)).each do |y|
      z = sum - x - y

      p [x, y, z]
      return "fix this method!" if x + y + z != sum

      if is_pythagorean_triplet?(x, y, z)
        return [x, y, z]
      end
    end
  end
end

triplet = find_pythagorean_triplet_from_sum(1000)

p triplet
p triplet.reduce(:*)