#!/usr/bin/env ruby
database = ARGV.shift
username = ARGV.shift
password = ARGV.shift
end_of_tier = ARGV.shift

`mysql.server start`

if end_of_iter.nil?
  backup_file = config[:database] + '_' + Time.now.strftime('%Y%m%d')
else
  backup_file = config[:database] + '_' + end_of_iter
end

mysqldump = "mysqldump -u#{config[:username]} -p " + "#{config[:database]}"

`#{mysqldump} > #{backup_file}.sql`
`gzip #{backup_file}.sql`
