require 'csv'
require 'byebug'
table =CSV.parse(File.read("test.csv"),headers: true)
byebug
puts table[2]

a ="৯০২.৫০ টাকা"
a.slice!(" টাকা")
#byebug
z = a.split("")

b1= { "১"=> "1" ,"২"=> "2"  ,"৩"=> "3" ,"৪"=> "4" ,"৫"=> "5" ,
  "৬"=> "6" ,"৭"=> "7" ,"৮"=> "8" ,"৯"=> "9" ,"০"=> "0","."=> "."  }
c=[]
z.each do |x|
   y = x.to_s
   c << b1[y]
end
st =""
c.map do |x|
  st = st+x
end
puts st

