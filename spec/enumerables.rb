module Enumerable
  def my_each
   for element in self
      yield element
    end
  end

  def my_each_with_index
    for i in (0..self.size-1)
      yield self[i], i
    end
  end

  def my_select
    array = []
    for element in self
      array << element if yield element
    end
    array
  end

  def my_all?
    return true unless block_given?

    if self.class == Hash
      my_each { |k, v| return false unless yield k, v }
    else
      my_each { |x| return false unless yield x }
    end
    true
  end

  def my_any?
    return true unless block_given?

    if self.class == Hash
      my_each { |k, v| return true if yield k, v }
    else
      my_each { |x| return true if yield x }
    end
    false
  end

  def my_none?(pattern = nil)
    if block_given?
      !my_any? { |x| yield x }
    else
      !my_any?(pattern)
    end
  end

  def my_count(item = nil)
    count = 0
    for i in self
      if !item.nil?
        count += 1 if i == item
      elsif block_given?
        count += 1 if yield i
      else
        count += 1
      end
    end
    count
  end

  def my_inject(init = nil)
    start = 0
    if init.nil?
      init = self[0]
      start = 1
    end

    for i in (start...self.size)
      init = yield(init, self[i])
    end
    init
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    mapped_array = []
    my_each { |element| mapped_array << yield(element) }
    mapped_array
  end
end

# Examples to test the above

# arr = [2, 3, 2, 4, 3]
# arr1 = %w[x i s]
# arr2 = []
# hash1 = { 'Jan' => 1, 'Feb' => 2, 'Mar' => 3 }

# arr.each { |x| puts x + 5 }
# arr.my_each { |x| puts x * 3 }

#puts [1,2,3].my_each_with_index do |x,idx|
#   puts "#{idx}"
#end

# puts arr.my_select { |x| x >= 3 }

# puts hash1.my_all? { |_k, v| v >= 1 }
# puts arr.my_all? { |x| x > 2 }

# puts arr.my_any? { |x| x > 4 }

# puts arr.my_none? { |x| x > 4 }

# puts arr.my_count
# puts arr.my_count(2)
# puts arr.my_count(&:even?)

# puts arr.my_inject { |final_val, x| final_val + x }
# puts arr.my_inject (1) { |final_val, x| final_val * x }

# puts arr1.my_map { |n| n.upcase }

