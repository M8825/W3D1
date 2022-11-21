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