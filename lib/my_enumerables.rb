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
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
end
