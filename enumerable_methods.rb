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
  # End of my_any?

  def my_none?
    if !block_given?
      my_each do |element|
        return false if element
      end
    else
      my_each do |element|
        return false if yield(element)
      end
    end
    true
  end
  # End of my_none?

  def my_count(*item)
    count = 0
    return size unless block_given?

    my_each do |element|
      if !item
        count += 1 if yield(element)
      elsif element == item
        count += 1
      end
      count
    end
  end
  # End of my_count

  def my_map
    result = []
    return self unless block_given?
    my_each do |element|
      result << yield(element)
    end
    result
  end
  # End of my_map

  def my_inject(initial = nil, sym = nil)
    if initial.is_a?(Symbol) || initial.nil?
      memo = first
      sym = initial
    else
      memo = initial
    end

    my_each do |element|
      next if element == memo
      memo =
        if block_given?
          yield(memo, element)
        else
          memo.send(sym, element)
        end
    end
    memo
  end
end
