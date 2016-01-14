class DiamondLetter
  SPACE = ' '

  def letters_to last_letter
    ('A'..last_letter.upcase).to_a
  end

  def pad_letter letter, index, length
    ident = SPACE * (length - index - 1)
    if index==0
      ident + letter
    else
      num_spaces_in_between = 2*index - 1
      ident + letter + SPACE*num_spaces_in_between + letter
    end
  end

  def pad_letters letters_array
    to_return = []
    len = letters_array.length
    letters_array.each_with_index do |l,i|
      to_return << pad_letter(l,i,len)
    end
    to_return
  end

  def mirror_array arr
    _, *tail = *(arr.reverse)
    arr + tail
  end

  def create_diamond mid_letter
    mirror_array(pad_letters(letters_to mid_letter))
  end

end
