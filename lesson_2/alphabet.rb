vowels = {}
count = 0
alphabet = ('A'..'Z').each do |letter|
  count += 1
  vowels[letter] = count if letter =~ /[aeiouy]/i
end
puts vowels
