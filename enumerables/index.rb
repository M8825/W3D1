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


a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true