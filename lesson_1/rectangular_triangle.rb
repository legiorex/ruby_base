puts 'Enter the first side of the triangle'
triangle_a = gets.chomp.to_f

puts 'Enter the second side of the triangle'
triangle_b = gets.chomp.to_f

puts 'Enter the third side of the triangle'
triangle_c = gets.chomp.to_f

triangle_current = [triangle_a, triangle_b, triangle_c]

hypotenuse = triangle_current.max

cathetus = triangle_current.reject { |value| value === hypotenuse }

if cathetus.empty?
  puts 'equilateral triangle'
elsif cathetus.size === 2
  cathetus_a = cathetus[0]
  cathetus_b = cathetus[1]
  is_orthogonal_triangle = hypotenuse**2 === (cathetus_a**2 + cathetus_b**2)

  isosceles_or_regular_triangle = cathetus_a === cathetus_b ? 'isosceles triangle' : 'regular triangle'

  puts is_orthogonal_triangle ? 'orthogonal triangle' : isosceles_or_regular_triangle
else
  puts 'isosceles triangle'
end
