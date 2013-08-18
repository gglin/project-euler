# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

#    3
#   7 4
#  2 4 6
# 8 5 9 3

# That is, 3 + 7 + 4 + 9 = 23.

# Find the maximum total from top to bottom of the triangle below:
triangle = [
%w{                            75                            },
%w{                          95  64                          },
%w{                        17  47  82                        },
%w{                      18  35  87  10                      },
%w{                    20  04  82  47  65                    },
%w{                  19  01  23  75  03  34                  },
%w{                88  02  77  73  07  63  67                },
%w{              99  65  04  28  06  16  70  92              },
%w{            41  41  26  56  83  40  80  70  33            },
%w{          41  48  72  33  47  32  37  16  94  29          },
%w{        53  71  44  65  25  43  91  52  97  51  14        },
%w{      70  11  33  28  77  73  17  78  39  68  17  57      },
%w{    91  71  52  38  17  14  91  43  58  50  27  29  48    },
%w{  63  66  04  68  89  53  67  30  73  16  69  87  40  31  },
%w{04  62  98  27  23  09  70  98  73  93  38  53  60  04  23} 
]

triangle = triangle.map {|row| row.map(&:to_i) }

# NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)


# brute force method:

@chains = []

def traverse(triangle, chain=[], x=0, y=0, &block)
  chain << triangle[x][y]
  # p chain
  @chains << chain if chain.size == triangle.size

  chain2 = chain.dup
  if x+1 < triangle.size && y+1 < triangle.size
    traverse(triangle, chain,  x+1, y,   &block) 
    traverse(triangle, chain2, x+1, y+1, &block)
  end
end

traverse(triangle)
p @chains
p @chains.size
p @chains.select {|chain| chain.size != triangle.size}

p @chains.map {|chain| chain.reduce(:+)}.max




# reduction method:
puts "\nClever method:"

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

15.downto(1) do |i|
  p @triangles[i]
end