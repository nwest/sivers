#!/usr/bin/env ruby

old_list = File.new('BACKUP.txt', 'r+')
new_list = File.new('NEW.txt', 'w')

article_number = 1
old_list.each do |line|
  if line.include? 'output'
    filename = line.split(' = ').last.gsub('"', '')
    new_list.puts "output = \"#{article_number}_#{filename.strip}\""
    article_number += 1
  else
    new_list.puts line
  end
end

old_list.close
new_list.close
