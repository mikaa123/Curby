require 'Curby'

include Curby

def plus_one n
  1.c( :+ ).call(n)
end

puts plus_one 1
puts plus_one 5

puts (1..5).map { |n| plus_one n }
