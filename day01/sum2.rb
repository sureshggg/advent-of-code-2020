#!/usr/bin/env ruby

input = File.new("input.txt").readlines.collect { |l| l.to_i }

map = {}

for i in 0..(input.length - 2)
  for j in i + 1..(input.length - 1)
    sum = input[i] + input[j]
    map[sum] = input[i]
  end
end

# input.each do |n|
#   map[n] = n
# end

SUM = 2020

input.each do |n|
  if map[SUM - n]
    puts n * map[SUM - n] * (SUM - n - map[SUM - n])
  end
end

# puts pairs.inspect
