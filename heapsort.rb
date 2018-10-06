# Why array based representation for Binary Heap?
# Since a Binary Heap is a Complete Binary Tree, it can be easily represented as array and array based representation is space efficient. If the parent node is stored at index I, the left child can be calculated by 2 * I + 1 and right child by 2 * I + 2 (assuming the indexing starts at 0).

# Heap Sort Algorithm for sorting in increasing order:
# 1. Build a max heap from the input data.
# 2. At this point, the largest item is stored at the root of the heap. Replace it with the last item of the heap followed by reducing the size of heap by 1. Finally, heapify the root of tree.
# 3. Repeat above steps while size of heap is greater than 1.

def heapify(array, heap_size, root_index)
  largest = root_index
  left = 2 * root_index + 1
  right = 2 * root_index + 2

  if left < heap_size && array[largest] < array[left]
    largest = left
  end

  if right < heap_size && array[largest] < array[right]
    largest = right
  end

  if largest != root_index
    array[root_index], array[largest] = array[largest], array[root_index]
    heapify(array, heap_size, largest)
  end
end

def heapsort(array)
  heap_size = array.size

  #Build a max heap
  (0..heap_size-1).reverse_each do |root_index|
    heapify(array, heap_size, root_index)
  end

  # One by one exact elements
  (1..(heap_size - 1)).reverse_each do |index|
    array[index], array[0] = array[0], array[index]
    heapify(array, index, 0)
  end

  array
end

# # Run this can help you understand about the heapify
# array = [4, 10, 3, 5, 1]
# heap_size = array.size
# puts array.inspect

# heapify(array, heap_size, 4)
# puts array.inspect
# heapify(array, heap_size, 3)
# puts array.inspect
# heapify(array, heap_size, 2)
# puts array.inspect
# heapify(array, heap_size, 1)
# puts array.inspect
# heapify(array, heap_size, 0)
# puts array.inspect

# Run this to understand the one by one exact elements
# array = [10, 5, 3, 4, 1]
# puts array.inspect

# array[4], array[0] = array[0], array[4]
# heapify(array, 4, 0)
# puts array.inspect
# array[3], array[0] = array[0], array[3]
# heapify(array, 3, 0)
# puts array.inspect
# array[2], array[0] = array[0], array[2]
# heapify(array, 2, 0)
# puts array.inspect
# array[1], array[0] = array[0], array[1]
# heapify(array, 1, 0)
# puts array.inspect

array = [10, 5, 3, 4, 1]
puts heapsort(array).inspect
