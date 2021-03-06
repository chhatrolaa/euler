#!/usr/bin/ruby -w
#
# Problem 14
# 05 April 2002
#
# The following iterative sequence is defined for the set of positive
# integers:
#
# n => n/2 (n is even)
# n => 3n+1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13 => 40 => 20 => 10 => 5 => 16 => 8 => 4 => 2 => 1
#
# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem), it
# is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

class Integer
  def trans
    if odd?
      self * 3 + 1
    else
      self / 2
    end
  end
  def odd?
    self & 1 == 1
  end
end

$memo_steps_for = { 1 => 0 }
def steps_for(n)
  if $memo_steps_for.has_key?(n)
    $memo_steps_for[n]
  else
    $memo_steps_for[n] = 1 + steps_for(n.trans)
  end
end

longest, length = 0, 0
2.upto(999_999) do |i|
  l = steps_for(i)
  if l > length
    longest, length = i, l
    # puts "longest=#{longest} (length=#{length})"
  end
end
puts "longest=#{longest} (length=#{length})"
