require 'csv'
require 'byebug'
def converter
  table =CSV.parse(File.read("test.csv"),headers: true)
# byebug
a = table.by_col[2]
c1=[]
d=[]
st = ""
#a ="৯০২.৫০ টাকা"
  a.each do |x|
    x.slice!(" টাকা")
    #byebug
    z = x.split("")

    b1= { "১"=> "1" ,"২"=> "2"  ,"৩"=> "3" ,"৪"=> "4" ,"৫"=> "5" ,
      "৬"=> "6" ,"৭"=> "7" ,"৮"=> "8" ,"৯"=> "9" ,"০"=> "0","."=> ".",","=> ","  }

    z.each do |x|
       y = x.to_s
       c1 << b1[y]
    end

    # st = ""
    c1.map do |x|
      st = st+x
    end
    c1 =[]
    # byebug
    d << st
    st = ""
     # byebug
    # puts st
  end
puts d
 byebug
end

converter
