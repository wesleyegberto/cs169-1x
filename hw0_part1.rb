=begin
> Define a method sum which takes an array of integers as an argument and returns
the sum of its elements. For an empty array it should return zero.

> Define a method max_2_sum which takes an array of integers as an argument and
returns the sum of its two largest elements. For an empty array it should return
zero. For an array with just one element, it should return that element.

> Define a method sum_to_n? which takes an array of integers and an additional
integer, n, as arguments and returns true if any two distinct elements in the
array of integers sum to n. An empty array or single element array should both
return false.
=end

def sum(array)
    return 0 if !array or array.empty?
    tot = 0
    array.each { |x| tot += x }
    return tot
    
    # could be: return array.inject(:+)
end

raise 'sum([]) != 0' unless sum([]) == 0
raise 'sum([1]) != 1' unless sum([1]) == 1
raise 'sum([1, 2, 3]) != 6' unless sum([1, 2, 3]) == 6


def max_2_sum(array)
    return 0 if !array or array.empty?
    return array.first if array.length == 1
    
    firstMax = array.max
    array.delete_at(array.find_index(firstMax))
    return firstMax + array.max
end

raise 'max_2_sum([]) != 0' unless max_2_sum([]) == 0
raise 'max_2_sum([5]) != 5' unless max_2_sum([5]) == 5
raise 'max_2_sum([1, 1, 3, 2]) != 5' unless max_2_sum([1, 1, 3, 2]) == 5
raise 'max_2_sum([1, 3, 3, 2]) != 6' unless max_2_sum([1, 3, 3, 2]) == 6
raise 'max_2_sum([1,-2,-3,-4,-5]) != -1' unless max_2_sum([1,-2,-3,-4,-5]) == -1


def sum_to_n?(array, n)
    return false if !array or array.length <= 1
    array.combination(2).to_a.each { |comb| return true if comb.inject(:+) == n }
    return false;
end

raise 'sum_to_n?([], 0) != false' unless sum_to_n?([], 0) == false
raise 'sum_to_n?([5], 5) != false' unless sum_to_n?([5], 5) == false
raise 'sum_to_n?([5, 3], 8) != true' unless sum_to_n?([5, 3], 8) == true
raise 'sum_to_n?([1,2,3,4,5], 5) != true' unless sum_to_n?([1,2,3,4,5], 5) == true
raise 'sum_to_n?([-1,-2,3,4,5,-8], 12) != false' unless sum_to_n?([-1,-2,3,4,5,-8], 12) == false


