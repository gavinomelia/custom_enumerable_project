module Enumerable
  def my_all?(&block)
    each do |element|
      return false unless block.call(element)
    end
    true
  end

  def my_any?(&block)
    each do |element|
      return true if block.call(element)
    end
    false
  end

  def my_count(&block)
    return size unless block_given?

    count = 0
    each do |element|
      count += 1 if block.call(element)
    end
    count
  end

  def my_each_with_index(&block)
    index = 0
    for element in self
      block.call(element, index)
      index += 1
    end
  end

  def my_inject(initial_value = first, &block)
    acc = initial_value
    start_index = initial_value == first ? 1 : 0

    drop(start_index).each do |element|
      acc = block.call(acc, element)
    end
    acc
  end

  def my_map(&block)
    acc = []
    for element in self
      acc << block.call(element)
    end
    acc
  end

  # def my_none?(&block)
  #   each do |element|
  #     return false if block.call(element)
  #   end
  #   true
  # end

  def my_none?(&block)
    !my_any?(&block)
  end

  def my_select(&block)
    acc = []
    for element in self
      acc << element if block.call(element)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for element in self
      yield(element)
    end
    self
  end
end
