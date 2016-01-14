#!/bin/ruby

require 'minitest/autorun'

class DiamondLetter
  SPACE = ' '
  def letters_to last_letter
    ('A'..last_letter).to_a
  end

  def pad_letter letter, index, length
    if index==0
      SPACE*(length-1) + letter
    else
      num_spaces_in_between = 2*index - 1
      mirrored_letter = letter + SPACE*num_spaces_in_between + letter
      num_ident = length - index - 1
      SPACE*num_ident + mirrored_letter
    end


  end

#  def pad_letters letters_array
#    to_return = []
#    len = letters_array.length
#    letters_array.each do |l,i|
#      to_return << pad_letter(l,i,len)
#    end
#  end

end


#==begin
#input: C
#output
#  A  
# B B 
#C   C
# B B
#  A
#==end



class TestDiamondLetter < MiniTest::Test
  def setup
    @diamond_letter = DiamondLetter.new
  end
  
  def test_pad_letter_should_return_indented_letter_for_first
    assert_equal @diamond_letter.pad_letter('X',0,1), 'X'
    assert_equal @diamond_letter.pad_letter('X',0,2), ' X'
    assert_equal @diamond_letter.pad_letter('X',0,3), '  X'
  end

  def test_pad_letter_should_return_indented_letter_mirrored_for_after_first
    assert_equal @diamond_letter.pad_letter('X',1,2), 'X X'
    assert_equal @diamond_letter.pad_letter('X',1,3), ' X X'
    assert_equal @diamond_letter.pad_letter('X',1,4), '  X X'

    assert_equal @diamond_letter.pad_letter('X',2,3), 'X   X'
    assert_equal @diamond_letter.pad_letter('X',2,4), ' X   X'
  end

  def test_letters_to_should_return_array_of_letter_to
    assert_equal( ['A','B','C','D','E'], @diamond_letter.letters_to('E') )
  end

end
