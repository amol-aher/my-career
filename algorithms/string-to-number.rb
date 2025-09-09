=begin
	Convert string like three hundred thousand to 3,00,000
=end

def words_to_number(text)
  units = {
    "zero"=>0, "one"=>1, "two"=>2, "three"=>3, "four"=>4, "five"=>5,
    "six"=>6, "seven"=>7, "eight"=>8, "nine"=>9, "ten"=>10,
    "eleven"=>11, "twelve"=>12, "thirteen"=>13, "fourteen"=>14, "fifteen"=>15,
    "sixteen"=>16, "seventeen"=>17, "eighteen"=>18, "nineteen"=>19
  }

  tens = {
    "twenty"=>20, "thirty"=>30, "forty"=>40, "fifty"=>50,
    "sixty"=>60, "seventy"=>70, "eighty"=>80, "ninety"=>90
  }

  scales = {
    "hundred"=>100,
    "thousand"=>1_000,
    "lakh"=>100_000,
    "million"=>1_000_000,
    "crore"=>10_000_000
  }

  words = text.downcase.gsub(/-/, ' ').split
  total = 0
  current = 0
  last_scale = 1

  words.each do |word|
    if units[word]
      current += units[word]
    elsif tens[word]
      current += tens[word]
    elsif word == "hundred"
      current *= scales[word]
    elsif scales[word]
      current *= scales[word]
      total += current
      current = 0
    end
  end

  total + current
end

words = "three hundred thousand"
num = words_to_number(words)
puts num