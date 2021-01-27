puts 'Enter the first a'
a = gets.chomp.to_f

puts 'Enter the second b'
b = gets.chomp.to_f

puts 'Enter the third c'
c = gets.chomp.to_f

d = b**2 - 4 * a * c
puts "D #{d}"

if d < 0
  puts "D = #{d} not sqrt"
else
  x_1 = (- b + Math.sqrt(d)) / 2 * a
  x_2 = (- b - Math.sqrt(d)) / 2 * a

  puts d === 0 ? "D = #{d} X = #{x_1}" : "D = #{d} X1 = #{x_1} X2 = #{x_2}"
end
