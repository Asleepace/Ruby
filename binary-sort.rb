def binary_sort(array)
  sorting = []
  maximum = array[0]  # sorted maximum value
  minimum = array[0]  # sorted minimum value
  array.each do |value|      # iterate array
    if value >= maximum      # check if max
       sorting.push(value)
       maximum = value
    elsif value <= minimum   # check if min
       sorting.unshift(value)
       minimum = value
    else                           # otherwise sort value with binary search
       starts = 0                  # first index
       finish = sorting.count      # last index
       while starts <= finish
         middle = (starts + finish) / 2   # calculate middle index
         
         # insert value at middle if is equal or less than middle and greater than previous
         if value == sorting[middle] || (value < sorting[middle] && value >= sorting[middle - 1])
            sorting.insert(middle, value)
            starts = finish + 1
        
        # insert above middle if bigger and smaller than next value
         elsif (value >= sorting[middle] && value <= sorting[middle + 1])
            sorting.insert(middle + 1, value)
            starts = finish + 1
            
         # move new start to middle if greater
         elsif value > sorting[middle]
            starts = middle + 1
            
        # move new finish to middle if smaller
         else
            finish = middle + 1
         end
       end
    end
  end
  return sorting # return sorted array
end
