#!/usr/bin/env ruby

input = File.new("input.txt").readlines.collect { |l| l.to_i }

map = {}

input.each do |n|
  map[n] = n
end


SUM = 2020

input.each do |n|
  if map[SUM - n]
    puts n * (2020 - n)
  end
end

# puts pairs.inspect
