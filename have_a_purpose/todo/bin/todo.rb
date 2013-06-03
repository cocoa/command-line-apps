#!/usr/bin/env ruby

TODO_FILE = "todo.txt"

# COMMANDS
#
# todo new "this is a brand new task"
# todo list
# todo done 1


# READ & WRITE Encapsulation of data
#
def write_todo(file,task,created=Time.now,completed='')
	file.puts "#{task},#{created},#{completed}"
end

def read_todo(line)
	line.chomp.split(/,/)
end


command = ARGV.shift

case command
when 'new'
	new_task = ARGV.shift
	File.open(TODO_FILE,'a') do |file|
		write_todo(file,new_task)
		puts "Task added."
	end

when 'list'
	File.open(TODO_FILE,'r') do |file|
		counter = 1
		file.readlines.each do |line|
			name,created,completed = read_todo(line)
			printf("%3d - %s\n", counter, name)
			printf("      Created: %s\n", created)
			unless completed.nil?
				printf("      Complet: %s\n", completed)
			end
			counter += 1
		end
	end

when 'done'
	task_number = ARGV.shift.to_i 

	File.open(TODO_FILE,'r') do |file|
		File.open("#{TODO_FILE}.new",'w') do |new_file|
			#...
			counter = 1
			file.readlines.each do |line|
				name,created,completed = read_todo(line)
				if (task_number==counter)
					write_todo(new_file,name,created,Time.now)
				else
					write_todo(new_file,name,created,completed)
				end
				counter += 1
			end
		end
	end
	`mv #{TODO_FILE}.new #{TODO_FILE}`
end



