# issue https://buttondown.com/cassidoo/archive/be-quick-but-never-hurry-john-wooden

# Write a function that takes a list of strings and returns the longest string
# that is a prefix of at least two strings in the list.

# Examples:

# longestCommonPrefix(["flower","flow","flowt"])
# "flow"
# longestCommonPrefix(["dog","racecar","car"])
# ""
# longestCommonPrefix(["interstellar","internet","interval"])
# "inter"

# ==========================================

def longest_common_prefix(words)
  prefix = ''
  lengths = {}
  shortest_word_length = Float::INFINITY

  words.each_with_index do |word, index|
    lengths[index] = word.size
    shortest_word_length = [shortest_word_length, word.size].min
  end

  (0...shortest_word_length).each do |index|
    current_letter = ''
    count = 0

    words.each_with_index do |word, idx|
      current_letter = word[index] if idx == 0
      count += 1 if word[index] == current_letter
    end

    prefix.concat(current_letter) if count == words.length
  end

  prefix
end

# ==========================================

puts longest_common_prefix(['flower','flow','flowt'])
puts longest_common_prefix(['dog','racecar','car'])
puts longest_common_prefix(['interstellar','internet','interval'])
