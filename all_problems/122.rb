# Problem 122: Efficient exponentiation
# http://projecteuler.net/problem=122

# The most naive way of computing n15 requires fourteen multiplications:
# n n  ... n = n15
# But using a "binary" method you can compute it in six multiplications:
# n n = n2n2n2 = n4n4n4 = n8n8n4 = n12n12n2 = n14n14n = n15
# However it is yet possible to compute it in only five multiplications:
# n n = n2n2n = n3n3n3 = n6n6n6 = n12n12n3 = n15
# We shall define m(k) to be the minimum number of multiplications to compute nk; for example m(15) = 5.
# For 1 k  200, find  m(k).

