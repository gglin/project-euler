# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

names = File.read('names.txt').split(',').map {|name| name.gsub("\"","")}.sort

p names
p names.size

class String
  def letter_score
    self.ord - 64
  end

  def word_score
    self.chars.map(&:letter_score).reduce(:+)
  end
end

p "COLIN".word_score

p names.each_with_index.map {|name, i| name.word_score * (i+1)}.reduce(:+)