numbers_fibonacci = [0, 1]

loop do
  number = numbers_fibonacci.last(2).sum

  break if number > 100

  numbers_fibonacci << number
end
print numbers_fibonacci
