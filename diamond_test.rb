require './diamond.rb'
require 'minitest/autorun'

class TestDiamondLetter < MiniTest::Test
  def setup
    @diamond_letter = DiamondLetter.new
  end

  def test_letters_to_should_return_array_of_letter_to
    assert_equal( ['A','B','C','D','E'], @diamond_letter.letters_to('E') )
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

  def test_pad_letters_array_should_return_pyramid
    assert_equal( [ '  A',
                    ' B B',
                    'C   C' ],
        @diamond_letter.pad_letters(['A','B','C']),
    )
  end

  def test_mirror_array_should_return_mirrored_array
    assert_equal( [1,2,1], @diamond_letter.mirror_array([1,2]) )
    assert_equal( [1,2,3,2,1], @diamond_letter.mirror_array([1,2,3]) )
  end

  def test_create_diamond_should_give_diamond_letter
    assert_equal(
                  [ '  A',
                    ' B B',
                    'C   C',
                    ' B B',
                    '  A' ],
      @diamond_letter.create_diamond('C'))
  end

end
