#!/usr/bin/env ruby

new_task = ARGV.shift # http://www.ruby-doc.org/core-1.9.3/Array.html#method-i-shift

File.open('todo.txt','a') do |file| 
	file.puts "#{new_task},#{Time.now}"
	puts "Task added."
end