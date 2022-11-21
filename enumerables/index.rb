require 'byebug'
class Array
  def my_each(&blc)
    i = 0
    while i < self.length
      blc.call(self[i])
      i += 1
    end

    return self
  end

  def my_select(&blc)
    new_arr = []

    self.my_each do |ele|
      if blc.call(ele)
        new_arr << ele
      end
    end

    return new_arr
  end

  def my_reject(&blc)
    new_arr = []

    self.my_each do |ele|
      if !blc.call(ele)
        new_arr << ele
      end
    end

    return new_arr
  end

  def my_any?(&blc)
    self.my_each do |ele|
      if blc.call(ele)
        return true
      end
    end

    return false
  end

  def my_all?(&blc)
    self.my_each do |ele|
      if !blc.call(ele)
        return false
      end
    end

    return true
  end

  def my_flatten
    return [self] if !self.instance_of?(Array)
    result = []
    self.my_each do |ele|
      result += ele.instance_of?(Array) ? ele.my_flatten : [ele]
    end
    return result
  end

  def my_zip(*arrs)
    # new_arr = Array.new(self.length) {Array.new(arrs.length + 1)}
    # arrs.unshift(self)

    # (0...self.length).each do |i|

    # end
    new_arr = []

    new_arrs =  arrs.unshift(self)
    (0...self.length).each do |i|
      min_arr = []
      (0...self.length).each do |j|
        min_arr << new_arrs[j][i]
      end

      new_arr << min_arr
    end

    return new_arr
  end

  def my_rotate(n=1)
    new_arr = self.dup

    if n > 0
      (0...n).each do |i|
        first_ele = new_arr.shift
        new_arr << first_ele
      end
    else
      (0...n.abs).each do 
        last_ele = new_arr.pop
        new_arr.unshift(last_ele)
      end
    end

    return new_arr
  end

  def my_join(separater = "")
    new_string = ""
    self.each_with_index do |ele, i|
      new_string += i == 0 ? ele : "#{separater}#{ele}"
    end
    new_string
  end

  def my_reverse
    new_arr = []

    (self.length - 1).downto(0) do |i|
      new_arr << self[i]
    end
    return new_arr
  end

end

# calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
#  end.my_each do |num|
#   puts num
#  end
#  # => 1
#      2
#      3
#      1
#      2
#      3

#  p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]


# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true


# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


# def my_rotate(n=1)
#   # new_arr = []
#   # temp_arr = []
#   new_arr = self.dup

#   if n > 0
#     (0...n).each do |i|
#       # temp_arr << self[1..-1] # [[1, 2,3,3], 3]
#       # temp_arr << self[0] 
#       # new_arr = temp_arr.my_flatten
#       # temp_arr = []
#       # [  "b", "c", "d", "a"]
#       first_ele = new_arr.shift
#       new_arr << first_ele
#     end
#   else
#     (0...n.abs).each do 
#       last_ele = new_arr.pop
#       new_arr.unshift(last_ele)
#     end
#   end
#   # return new_arr
#   return new_arr
# end


#   a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"



# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]