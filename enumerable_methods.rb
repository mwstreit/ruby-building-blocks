module Enumerable
  def my_each
    for element in self do
      yield(element)
    end
    self
  end

  def my_each_with_index
    for element in self do
      index = self.index(element)
      yield(element, *index)
    end
    self
  end

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
end
