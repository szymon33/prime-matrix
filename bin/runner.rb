#!/usr/bin/env ruby
require './lib/multiplication'


loop do
  print 'Input size or leave blank to exit: '
  input = gets.chomp
  break if input.empty?
  Multiplication.new(input).display
end
puts 'Bye!'

