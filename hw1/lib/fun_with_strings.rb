module FunWithStrings
  def palindrome?
    self.downcase.gsub(/[\W]/, "") == self.downcase.gsub(/[\W]/, "").reverse
  end
  def count_words
    dict = {}
    self.downcase.gsub(/(\w+)/).each do |el|
    	if dict.has_key?(el)
    		dict[el] = dict[el] + 1
    	else
    		dict[el] = 1
    	end
    end
    return dict
  end
  def anagram_groups
  	return [] if self.length < 1
    words = self.scan(/(\w+)/)
	words.permutation(2).to_a.each { |x,y|
	    if x.first.to_s.downcase.scan(/\w/).permutation.to_a.include?(y.first.to_s.downcase.scan(/\w/))
	        x << y.first
	    end
	}
    return words
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end