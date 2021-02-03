vowels = {}

('A'..'Z').each.with_index(1) do |letter, index|
  vowels[letter] = index if letter =~ /[aeiouy]/i
end

puts vowels
