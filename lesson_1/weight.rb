puts 'What is your name?'

name = gets.chomp

puts 'How height are you?'

height = Integer(gets.chomp)

weight = (height - 110) * 1.15

if weight < 0
  puts "#{name} you weight is good!"
else
  puts "#{name} you weight is no good!"
end
