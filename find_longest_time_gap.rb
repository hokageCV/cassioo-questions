# issue [398](https://buttondown.com/cassidoo/archive/it-is-never-too-late-to-be-what-you-might-have)

# Write a function that takes an array of timestamps (HH:MM) from the same day and
# returns the longest gap in minutes between consecutive timestamps.

# Examples:

# findLongestTimeGap(['12:00'])
# 0
# findLongestTimeGap(['09:00', '11:00'])
# 120
# findLongestTimeGap(['14:00', '09:00', '15:00', '10:30'])
# 210
# findLongestTimeGap(['08:00', '10:00', '10:00', '14:00'])
# 240

# ==========================================

def find_longest_time_gap1(time_array)
  return 0 if time_array.length <= 1
  mins_array = convert_to_mins(time_array).sort

  max_difference = 0
  mins_array.each_with_index do |time, index|
    next if index == 0

    difference = time - mins_array[index-1]
    max_difference = [max_difference, difference].max
  end

  max_difference
end

def convert_to_mins(time_array)
  time_array.map do |time_string|
    hours, minutes = time_string.split(':').map(&:to_i)
    (hours * 60) +minutes
  end
end

def find_longest_time_gap(time_array)
  return 0 if time_array.length <= 1
  mins_array = convert_to_mins(time_array).sort

  max_gap = mins_array.each_cons(2).map { |a, b| b - a }.max
  max_gap || 0
end

# ==========================================

puts find_longest_time_gap(['12:00'])
puts find_longest_time_gap(['09:00', '11:00'])
puts find_longest_time_gap(['14:00', '09:00', '15:00', '10:30'])
puts find_longest_time_gap(['08:00', '10:00', '10:00', '14:00'])
