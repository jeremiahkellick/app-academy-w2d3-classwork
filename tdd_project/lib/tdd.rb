def my_uniq(arr)
  without_dups = []
  hash = {}
  arr.each do |el|
    unless hash.has_key?(el)
      without_dups << el
      hash[el] = true
    end
  end
  without_dups
end

class Array
  def two_sum
    hash = {}
    pairs = []
    self.each_with_index do |el, i|
      if hash.has_key?(-el)
        hash[-el].each { |j| pairs << [j, i] }
      end
      if hash.has_key?(el)
        hash[el] << i
      else
        hash[el] = [i]
      end
    end
    pairs.sort
  end
end

def my_transpose(arrs)
  arrs[0].each_index.map { |i| arrs.map { |arr| arr[i] } }
end

def stock_picker(arr)
  return nil if arr.length < 2
  best_pair = [0,1]
  if arr[best_pair[0]] < arr[best_pair[1]]
    lowest = best_pair[0]
    lowest_i = 0
  else
    lowest = best_pair[1]
    lowest_i = 1
  end
  arr[2..-1].each_with_index do |price, i|
    if price - lowest > arr[best_pair[1]] - arr[best_pair[0]]
      best_pair = [lowest_i, i+2]
    end
    if price < lowest
      lowest = price
      lowest_i = i+2
    end
  end
  best_pair
end
