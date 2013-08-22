#!/usr/bin/env ruby
current_directory = Dir.pwd
Dir['*'].each do |file|
  puts "linking #{current_directory}/#{file} --> ~/.#{link}"
  system "ln -nfs #{current_directory}/#{file} ~/.#{link}"
end