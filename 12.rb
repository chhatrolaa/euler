#!/usr/bin/ruby -w
#
# Problem 12
# 08 March 2002

# The sequence of triangle numbers is generated by adding the natural
# numbers. So the 7th triangle number would
# be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
#
#     1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# Let us list the factors of the first seven triangle numbers:
#
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.
#
# What is the value of the first triangle number to have over five hundred
# divisors?

#puts 'unsolved'

require 'primes'

class Integer
  def triangle
    (self * (self + 1)) / 2
  end
end

raise "Bad triangle" unless 7.triangle == 28 && 10.triangle == 55

#puts '*** brute force takes way too long (more than 3hrs) ***'; exit

max_d = 0
1.upto(1_000_000) do |n|
  t = n.triangle
  d = Prime.divisors(n.triangle)
  if d > max_d
    puts "%5d => %8d: %d"%[n, t, d ]
    max_d = d
  end
  next unless d >= 500
  exit
end

#     1 =>        1: 1
#     2 =>        3: 2
#     3 =>        6: 4
#     7 =>       28: 6
#     8 =>       36: 9
#    15 =>      120: 16
#    24 =>      300: 18
#    32 =>      528: 20
#    35 =>      630: 24
#    63 =>     2016: 36
#    80 =>     3240: 40
#   104 =>     5460: 48
#   224 =>    25200: 90
#   384 =>    73920: 112
#   560 =>   157080: 128
#   935 =>   437580: 144
#  1224 =>   749700: 162
#  1664 =>  1385280: 168
#  1728 =>  1493856: 192
#  2015 =>  2031120: 240
#  2079 =>  2162160: 320
#  5984 => 17907120: 480
# 12375 => 76576500: 576

# real	0m8.654s
# user	0m8.578s
# sys	0m0.057s

