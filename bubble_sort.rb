def bubble_sort(array)
  sorted = false

  until sorted
    sorted = true
    array.each_with_index do |element, index|
      next if index == array.length - 1 # Do not want to go beyond array length
      next_element = array[index + 1]

      next unless element > next_element
      array[index] = next_element
      array[index + 1] = element
      sorted = false
    end
  end

  array
end

p bubble_sort([4, 3, 78, 2, 0, 2])
p bubble_sort([6, 5, 4, 3, 2, 1, 0])

# Method using block passed to it
def bubble_sort_by(array)
  sorted = false

  until sorted
    sorted = true
    array.each_with_index do |element, index|
      next if index == array.length - 1 # Do not want to go beyond array length
      next_element = array[index + 1]

      next unless yield(element, next_element) == 1
      array[index] = next_element
      array[index + 1] = element
      sorted = false
    end
  end

  array
end

p bubble_sort([4, 3, 78, 2, 0, 2]) do |left, right|
  left <=> right
end

p bubble_sort([6, 5, 4, 3, 2, 1, 0]) do |left, right|
  left <=> right
end
