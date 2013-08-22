# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.


# How many such routes are there through a 20×20 grid?

# stupid slow
def grid_slow(x, y)
  if (x == 0 || y == 0)
    return 1
  else
    puts "#{x}, #{y}"
    return grid(x, y-1) + grid(x-1, y)
  end
end

# still way too slow
def grid(x, y)
  @grid ||= Array.new(x+1, [1])
  # p "#{x}, #{y}"
  if (x == 0 || y == 0)
    @grid[x][y] = 1
  else
    @grid[x][y] = grid(x, y-1) + grid(x-1, y)
  end
end

# this is a central binomial coefficient:
# 2n choose n
# 
class Integer
  # binomial coefficient: n.choose(k)
  def choose(k)
    # n!/(n-k)!
    numerator = (self-k+1 .. self).reduce(1, &:*) 
    # k!
    denominator = (2 .. k).reduce(1, &:*)
    numerator / denominator
  end
end

n = 10
p grid(n, n)
p (2*n).choose(n)

n = 20
p (2*n).choose(n)