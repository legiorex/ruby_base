goods = {}

loop do
  puts 'Get product name'

  product_name = gets.chomp

  break if product_name == 'stop'

  puts 'Get product price'

  product_price = gets.chomp

  puts 'Get product count'

  product_count = gets.chomp

  goods[product_name.to_sym] = { price: product_price.to_f, count: product_count.to_f }
end

check_out = 0

goods.each do |key, value|
  price = value[:price]
  count = value[:count]
  total = price * count
  check_out += total

  puts "#{key} - price: #{price}, count: #{count}, total: #{total}"
end
puts "check_out: #{check_out}"
