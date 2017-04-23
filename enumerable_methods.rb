module Enumerable
  def my_each
    for element in self do
      yield(element)
    end
    self
  end
  # End of my_each

  def my_each_with_index
    for element in self do
      index = self.index(element)
      yield(element, *index)
    end
    self
  end
  # End of my_each_with_index

  def my_select
    array = []
    if block_given?
      my_each do |element|
        array << element if yield(element)
      end
      array
    else
      self
    end
  end
  # End of my_select

  def my_all?
    if !block_given?
      my_each do |element|
        return false unless element
      end
    else
      my_each do |element|
        return false unless yield(element)
      end
    end
    true
  end
  # End of my_all?

  def my_any?
    if !block_given?
      my_each do |element|
        return true if element
      end
    else
      my_each do |element|
        return true if yield(element)
      end
    end
    false
  end
end
