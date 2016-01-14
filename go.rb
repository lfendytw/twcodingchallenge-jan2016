require './diamond.rb'

diamond_letter = DiamondLetter.new
diamond_lines = diamond_letter.create_diamond ARGV.shift
diamond_lines.each {|line| puts line}
