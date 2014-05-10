=begin
> Define a method hello(name) that takes a string representing a name and returns
the string "Hello, " concatenated with the name.

> Define a method starts_with_consonant?(s) that takes a string and returns true
if it starts with a consonant and false otherwise. (For our purposes, a consonant
is any letter other than A, E, I, O, U.) NOTE: be sure it works for both upper 
and lower case and for nonletters!

> Define a method binary_multiple_of_4?(s) that takes a string and returns true 
if the string represents a binary number that is a multiple of 4. NOTE: be sure 
it returns false if the string is not a valid binary number!
=end

def hello(name)
    return "Hello, " + name 
end

raise "hello('Wesley') != 'Hello, Wesley'" unless hello('Wesley') == 'Hello, Wesley'

def starts_with_consonant?(s)
    return false if !s or s.length == 0
    return !/\A[aeiou\W\d].*/i.match(s)
end

raise 'starts_with_consonant?("Asf") != false' unless starts_with_consonant?("Asf") == false
raise 'starts_with_consonant?("2asdsf") != false' unless starts_with_consonant?("2asdsf") == false
raise 'starts_with_consonant?("Csd#Asf") != true' unless starts_with_consonant?("Csd#Asf") == true
raise 'starts_with_consonant?("impart") != false' unless starts_with_consonant?("impart") == false
raise 'starts_with_consonant?("#!ASC2dd@") != false' unless starts_with_consonant?("#!ASC2dd@") == false
raise 'starts_with_consonant?("") != false' unless starts_with_consonant?("") == false
raise 'starts_with_consonant?("#foo") != false' unless starts_with_consonant?("#foo") == false


def binary_multiple_of_4?(s)
   return true if (/\d+/ =~ s) == 0 and s.to_i % 4 == 0
   return false
end

raise 'binary_multiple_of_4?("214") != false' unless binary_multiple_of_4?("214") == false
raise 'binary_multiple_of_4?("169") != false' unless binary_multiple_of_4?("169") == false
raise 'binary_multiple_of_4?("200") != true' unless binary_multiple_of_4?("200") == true
raise 'binary_multiple_of_4?("16") != true' unless binary_multiple_of_4?("16") == true
raise 'binary_multiple_of_4?("add334sdf") != false' unless binary_multiple_of_4?("add334sdf") == false
raise 'binary_multiple_of_4?("aWx53as443sad233") != false' unless binary_multiple_of_4?("aWx53as443sad233") == false
raise 'binary_multiple_of_4?("23Asccv333") != false' unless binary_multiple_of_4?("23Asccv333") == false
