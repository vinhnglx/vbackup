#!/usr/bin/env ruby

require 'optparse'

`mysql.server start`

options = {}
option_parser = OptionParser.new do |opts|
  # Create flag user
  opts.on("-u USER") do |user|
    options[:user] = user || 'root'
  end

  # Create flag database
  opts.on("-d DATABASE") do |database|
    options[:database] = database || 'test'
  end
end

option_parser.parse!

backup_file = options[:database] + '_' + Time.now.strftime('%Y%m%d')

# Generate backup file
mysqldump = "mysqldump -u #{options[:user]} -p " + "#{options[:database]}"

`#{mysqldump} > #{backup_file}.sql`
`gzip #{backup_file}.sql`
