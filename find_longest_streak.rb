# issue [397](https://buttondown.com/cassidoo/archive/this-present-moment-was-once-the-unimaginable)

# Write a function that finds the longest streak of consecutive true values in a boolean array
# that meets or exceeds a given streak goal.
# Return 0 if no such streak exists.

# Examples:

# findLongestStreak([true, true, false, true, true, true], 3)
# 3
# findLongestStreak([true, true, true, false, true], 4)
# 0
# findLongestStreak([true, true, true, true], 2)
# 4

# ==========================================

# first try

def find_longest_streak0(bool_array, goal)
  longest_streak = 0
  current_streak = 0

  bool_array.each_with_index do |bool, index|
    if bool
      current_streak += 1
    else
      longest_streak = current_streak if current_streak >= longest_streak
      current_streak = 0
    end

    if index == bool_array.size - 1
      longest_streak = current_streak if current_streak >= longest_streak
    end
  end

  longest_streak >= goal ? longest_streak : 0
end

def find_longest_streak(bool_array, goal)
  longest_streak = 0
  current_streak = 0

  bool_array.each do |bool|
    if bool
      current_streak += 1
    else
      longest_streak = [longest_streak, current_streak].max
      current_streak = 0
    end
  end

  longest_streak = [longest_streak, current_streak].max
  longest_streak >= goal ? longest_streak : 0
end

# ==========================================

puts find_longest_streak([true, true, false, true, true, true], 3)
puts find_longest_streak([true, true, true, false, true], 4)
puts find_longest_streak([true, true, true, true], 2)
