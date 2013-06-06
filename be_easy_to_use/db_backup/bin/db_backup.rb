#!/usr/bin/env ruby

# Bring OptionParser into the namespace
require 'optparse'

options = {}

option_parser = OptionParser.new do |opts|

	# Create a switch
	opts.on("-i", "--iteration") do
		options[:iteration] = true
	end

	# Create a flag
	opts.on("-u USER") do |user|
		options[:user] = user
	end

	# Validated user flag
=begin
	opts.on("-v VALID_USER") do |user| 
		unless user =~ /^.+\..+$/
			raise ArgumentError,"USER must be in 'first.last' format"
		end
  	options[:valid_user] = user
	end
=end 

	# Validated user flag (compact mode)
	opts.on("-v VALID_USER",/^.+\..+$/) do |user|
  	options[:valid_user] = user
	end

	opts.on("-p PASSWORD") do |password|
		options[:password] = password
	end

end

option_parser.parse!
puts options.inspect


