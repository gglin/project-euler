# Problem 334: Spilling the beans
# http://projecteuler.net/problem=334

# In Plato's heaven, there exist an infinite number of bowls in a straight line.
# Each bowl either contains some or none of a finite number of beans.
# A child plays a game, which allows only one kind of move: removing two beans from any bowl, and putting one in each of the two adjacent bowls. The game ends when each bowl contains either one or no beans.
# 
# For example, consider two adjacent bowls containing 2 and 3 beans respectively, all other bowls being empty. The following eight moves will finish the game:
# 
# http://projecteuler.net/project/images/p_334_beans.gif
# 
# You are given the following sequences:
#       t0 = 123456.
#    
# 
#       ti = 
#    
#    http://projecteuler.net/project/images/p_334_cases.gif
#    
#    
#       
#          ti-12
#       
#          ,
#       
#       
#       
#          if ti-1 is even
#       
#       http://projecteuler.net/project/images/p_334_lfloor.gif
#       
#          ti-12
#       
#          http://projecteuler.net/project/images/p_334_rfloor.gif
#       
#          926252, 
#       
#       
#          if ti-1 is odd
#       
#       
# 
#    
#    
#       where ⌊x⌋ is the floor function
#    
# 
#    
#    
#       and http://projecteuler.net/project/images/p_334_oplus.gif is the bitwise XOR operator.
#    
# 
#       bi = ( ti mod 2^11) + 1.
#    
# The first two terms of the last sequence are b1 = 289 and b2 = 145.
# If we start with b1 and b2 beans in two adjacent bowls, 3419100 moves would be required to finish the game.
# 
# Consider now 1500 adjacent bowls containing b1, b2,..., b1500 beans respectively, all other bowls being empty. Find how many moves it takes before the game ends.

