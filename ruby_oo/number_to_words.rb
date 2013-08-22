# Write a program that will take a number from 0 to 999,999,999,999 and spell out that number in British English.

# In other words, if the input to the program is 12345 then the output should be twelve thousand three hundred forty-five.

class Say

  ONES = %w{NO one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty}
  TENS = %w{NO NO twenty thirty forty fifty sixty seventy eighty ninety}
  IONS  = ["", "thousand", "million", "billion", "trillion", "quadrillion", "quintillion", "sextillion", "septillion"]

  attr_accessor :number

  def initialize(num)
    @number = num
  end


  def in_english
    return "zero" if @number == 0
    num_str = @number.to_s
    num_digits = num_str.size

    # sanitize so num_digits is divisible by 3
    num_str = ("00" + num_str) if num_digits % 3 == 1
    num_str = ("0"  + num_str) if num_digits % 3 == 2

    # separate number string into array of three digits each
    num_array = num_str.scan(/.../)

    word = ""
    index = 0
    num_array.reverse_each do |three_digit_str|
      added = if three_digit_str == "000"
                ""
              else
                hundreds(three_digit_str) + " " + IONS[index]
              end
      word = added + " " + word
      index += 1
    end
    word.strip.gsub(/\s+/," ")
  end


  def tens(two_digit_str)
    first_digit  = two_digit_str[0].to_i
    second_digit = two_digit_str[1].to_i
    both_digits  = two_digit_str.to_i

    if two_digit_str == "00"
      ""
    elsif both_digits <= 20
      ONES[both_digits]
    else
      added = second_digit==0  ?  ""  :  ("-" + ONES[second_digit])
      TENS[first_digit] + added
    end
  end


  def hundreds(three_digit_str)
    first_digit  = three_digit_str[0].to_i
    next_two_str = three_digit_str[1,2]

    if    three_digit_str.between?("000","099")
      tens(next_two_str)
    elsif three_digit_str.between?("100","999")
      and_word = next_two_str=="00"  ?  ""  :  "and "
      ONES[first_digit] + " hundred " + and_word + tens(next_two_str)
    end
  end

end

