require 'csv'

CSV.open('t.csv', 'w') do |csv|
  a = [
    { a: 1, b: 2 },
    { c: 3, d: 4 },
    { a: 1, b: 2, d: 4 },
    { d: 4, c: 3, a: 1 }
  ]

  headers = %i[a b c d] # array of header symbols; should match the datatype of the keys in 'a' above
  csv << headers

  a.each do |h|
    csv << h.values_at(*headers) # you need to preserve the order of columns manually before writing to each row
  end
end
