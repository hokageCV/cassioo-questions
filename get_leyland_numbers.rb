# issue [399](https://buttondown.com/cassidoo/archive/8-you-can-have-a-plan-but-you-have-to-be-flexible)

# Write a function that returns the first n Leyland numbers in ascending order.
# A Leyland number is defined as x^y + y^x for integers x > 1 and y > 1.

# Examples:

# getLeylandNumbers(1)
# [8]
# getLeylandNumbers(5)
# [8, 17, 32, 54, 57]

# ==========================================

def get_leyland_numbers(number)
  end_range = number + 1

  result = []
  (2..end_range).each do |x|
    (2..x).each do |y|
      result << (x**y) + (y**x)
    end
  end

  result.sort.first(number)
end

# ==========================================

puts "result: #{get_leyland_numbers(1)}"
puts "result: #{get_leyland_numbers(5)}"
