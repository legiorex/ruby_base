puts 'get year'
year = gets.chomp.to_i

loop do
  if year.zero?
    puts 'You entered the wrong year format.'
    year = gets.chomp.to_i
  elsif year.to_s.size != 4
    puts 'You entered the wrong year format.'
    year = gets.chomp.to_i
  end
  break if year.to_s.size == 4 && year.to_i != 0
end
year = year.to_i
is_leap_year = (year % 4).zero? || (year % 400).zero?

days_february = is_leap_year ? 29 : 28

months = {
  1 => 31,
  2 => days_february,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31
}

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
  unless (1..months[current_month]).include?(current_day)
    puts 'You entered the wrong day in the selected month, please try again.'
    current_day = gets.chomp.to_i
  end
  break if (1..months[current_month]).include?(current_day)
end

count_date = 0
months.each do |month, day|
  count_date += day if month != current_month
  count_date += current_day if month == current_month
end

puts " count #{count_date}"
