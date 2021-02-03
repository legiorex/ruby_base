puts 'get year'
year = gets.chomp.to_i

loop do
  if year.zero?
    puts 'You entered the wrong year format.'
    year = gets.chomp.to_i
  elsif year.to_s.size > 4
    puts 'You entered the wrong year format.'
    year = gets.chomp.to_i
  end
  break if year.to_s.size <= 4 && year.to_i != 0
end
year = year.to_i

is_leap_year = ((year % 4).zero? && !(year % 100).zero?) || (year % 400).zero?

days_february = is_leap_year ? 29 : 28

months = [31, days_february, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts 'get month'
current_month = gets.chomp.to_i
loop do
  unless (1..12).include?(current_month)
    puts 'You entered the wrong month, please try again.'
    current_month = gets.chomp.to_i
  end
  break if (1..12).include?(current_month)
end

puts 'get day'
current_day = gets.chomp.to_i

loop do
  unless (1..months[current_month - 1]).include?(current_day)
    puts 'You entered the wrong day in the selected month, please try again.'
    current_day = gets.chomp.to_i
  end
  break if (1..months[current_month - 1]).include?(current_day)
end

if current_month == 1
  puts " count #{current_day}"
else
  puts " count #{months.take(current_month - 1).sum + current_day}"
end
