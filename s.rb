require 'nokogiri'
require 'httparty'
require 'byebug'
require 'csv'
#require 'pry'
require 'selenium-webdriver'
require 'language_converter'
def scraper

#puts "Give the URL"
#url = gets.chomp
url ="https://www.prothoma.com/publisher"
url= url+"?page=1"
unparsed_page = HTTParty.get(url)
parsed_page = Nokogiri::HTML(unparsed_page.body)
pub_list = parsed_page.css('div.category_list_single_block')

publisher_array = Array.new

pub_first_page = 22
pub_last_page =22
a =url
while pub_first_page <= pub_last_page

  x= a.delete_suffix(a[-1]) + "#{pub_first_page}"

  pagination_url = x

  unparsed_page = HTTParty.get(pagination_url)
  parsed_page = Nokogiri::HTML(unparsed_page.body)

  pagination_pub_list = parsed_page.css('div.category_list_single_block')
#byebug
  pagination_pub_list.each do |publisher|
    publisher = {
    #name: publisher.css('div.category_info_ct_block').text,
    url: publisher.css('a')[0].attributes["href"].value

  }
  publisher_array << publisher

end
pub_first_page += 1

end
      # CSV.open("csv/publisher.csv",'w') do |csv|
      #   csv << ['Title','URL']
      #   publisher_array.each do |product|
      #     #product = temp.merge(product)
      #     csv << CSV::Row.new(product.keys,product.values)
      #   end
      # end



  publisher_array.each do |pub_url|
    # puts "Give the URL"
    # url = gets.chomp

    url= pub_url.values[0] +"?page=1"
    #byebug
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "#{url}"
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until {  driver.find_elements(:class, "product-amount")[0].text.split(" ")[0] !=nil }
    a = driver.find_elements(:class, "product-amount")[0].text.split(" ")[0]

    #a ='৪৭০১৫৬২০১৩৮৯'

    #converter
    z = a.split("")
    b1= { "১"=> "1" ,"২"=> "2"  ,"৩"=> "3" ,"৪"=> "4" ,"৫"=> "5" ,
      "৬"=> "6" ,"৭"=> "7" ,"৮"=> "8" ,"৯"=> "9" ,"০"=> "0"  }
    c=[]
    z.each do |x|
       y = x.to_s
       c << b1[y]
    end
    st =""
    c.map do |x|
      st = st+x
    end
    # puts st
    #converter

    total_products = st.to_i
    # puts total_products


    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page.body)
    product_array = Array.new
    products = parsed_page.css('div.product_single')
    per_page = products.count
    page = 1
    if total_products > 0
      last_page = (total_products.to_f / per_page.to_f).ceil
    else
      last_page= page
    end
    #last_page = (total_products.to_f / per_page.to_f).ceil

    n=0
    publisher =parsed_page.css('div.media-body').text.gsub(/\n/," ").strip
    a = url
    while page <= last_page

      x= a.delete_suffix(a[-1]) + "#{page}"

      pagination_url = x

      pagination_unparsed_page = HTTParty.get(pagination_url)
      pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page.body)
      pagination_products = pagination_parsed_page.css('div.product_single')

      pagination_products.each  do|product|
        product ={
          title: product.css('h2').text,
          author: product.css('h3').text,
          original_price: product.css('span.price_2').text,
          discounted_price: product.css('span.price_1').text,
          url: product.css('a')[0].attributes["href"].text,
          image: product.css('img')[0].attributes["src"].text
        }
          product_array << product
      end
      page += 1
    end
    temp = {
          title: " ",
          author: " ",
          original_price: " ",
          discounted_price: " ",
          url: " ",
          image: " "
        }
    # byebug
      CSV.open("csv/#{publisher}.csv",'w') do |csv|
        csv << ['Title','Author','Original Price','Discounted Price','URL','Image']
        product_array.each do |product|
          product = temp.merge(product)
          csv << CSV::Row.new(product.keys,product.values)
        end
      end
      driver.quit
      puts "#{publisher}.csv is created"

  end
end
scraper
