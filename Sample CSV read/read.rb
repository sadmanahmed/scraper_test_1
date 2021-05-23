require 'csv'
require 'byebug'

d = Dir.new('.')
# byebug
# This will find all files whose path ends in .csv
csvs = d.entries.select {|e| /^.+\.csv$/.match(e)}


@x=[]
csvs.each do |a|
  #byebug
  # a is the file name
  # puts a

  table =CSV.parse(File.read(a))
  table.shift
  #puts table
  @x << table

  # byebug

end

@x.each do |w|
  #print
  a=w
  a
  byebug
end
