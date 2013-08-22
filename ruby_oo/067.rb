# Problem 67: Maximum path sum II
# http://projecteuler.net/problem=67

# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
# 
# 3
# 7 4
# 2 4 6
# 8 5 9 3
# That is, 3 + 7 + 4 + 9 = 23.
# 
# Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.
# NOTE: This is a much more difficult version of Problem 18. It is not possible to try every route to solve this problem, as there are 2^99 altogether! If you could check one trillion (10^12) routes every second it would take over twenty billion years to check them all. There is an efficient algorithm to solve it. ;o)

triangle = File.readlines('triangle.txt').map do |line|
  line.strip.split(" ").map(&:to_i)
end

p triangle

@triangles = []

def shrink(triangle=[])
  @triangles[triangle.size] = triangle

  if triangle.size > 1
    reduced_triangle = triangle[0..-3]
    last_row = triangle[-2].map.with_index do |element, index|
      [ element + triangle[-1][index], element + triangle[-1][index+1] ].max
    end
    reduced_triangle << last_row
    shrink(reduced_triangle)
  else
    triangle
  end
end

shrink(triangle)

10.downto(1) do |i|
  p @triangles[i]
end