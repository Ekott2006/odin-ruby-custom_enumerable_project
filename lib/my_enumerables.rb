module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self
      yield(elem)
    end
  end

  def my_map
    result = []
    for elem in self
      result << yield(elem)
    end
    result
  end

  def my_each_with_index
    result = []
    self.length.times do |i|
      result << self[i]
      yield(self[i], i)
    end
    result
  end

  def my_all?
    for elem in self
      return false unless yield(elem)
    end
    true
  end

  def my_select
    result = []
    for elem in self
      result << elem if yield(elem)
    end
    result
  end

  def my_count
    count = 0
    for elem in self
      count += 1 if ( block_given? ? yield(elem) : true)
    end
    count
  end

  def my_any?
    for elem in self
      return true if yield(elem)
    end
    false
  end

  def my_none?
    for elem in self
      return false if yield(elem)
    end
    true
  end

  def my_inject (initial_value)
    result = initial_value
    for elem in self
      result = yield(result, elem)
    end
    result
  end
end
