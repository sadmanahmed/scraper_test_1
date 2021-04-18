require 'csv'

CSV.foreach ('ABP Pvt Ltd.csv') do |row|
  puts row.inspect
end
