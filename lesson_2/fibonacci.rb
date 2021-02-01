numbers_fibonacci = []

loop do
  numbers_fibonacci = [0, 1] if numbers_fibonacci.empty?

  number1, number2 = numbers_fibonacci.last(2)
  fibonacci_number = number1 + number2
  break if fibonacci_number > 100

  numbers_fibonacci << fibonacci_number
end
print numbers_fibonacci
