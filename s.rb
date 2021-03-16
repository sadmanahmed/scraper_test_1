require 'nokogiri'
require 'httparty'
require 'byebug'
require 'csv'
#require 'pry'
require 'selenium-webdriver'
require 'language_converter'
def scraper
puts "Give the URL"
url = gets.chomp
driver = Selenium::WebDriver.for :chrome
driver.navigate.to "#{url}"
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until {  driver.find_elements(:class, "product-amount")[0].text.split(" ")[0] !=nil }
a = driver.find_elements(:class, "product-amount")[0].text.split(" ")[0]

total_products = lc(a,'en','bn').to_i






unparsed_page = HTTParty.get(url)
parsed_page = Nokogiri::HTML(unparsed_page.body)

product_array = Array.new

products = parsed_page.css('div.product_single')

per_page = products.count
page = 1


last_page = (total_products.to_f / per_page.to_f).ceil

n=0
publisher =parsed_page.css('div.media-body').text.gsub(/\n/," ").strip

while page <= last_page
  pagination_url =
  "https://www.prothoma.com/publisher/%E0%A6%85%E0%A6%A8%E0%A7%81%E0%A6%AA%E0%A6%AE-%E0%A6%AA%E0%A7%8D%E0%A6%B0%E0%A6%95%E0%A6%BE%E0%A6%B6%E0%A6%A8%E0%A7%80?page=#{page}"
  a= "https://www.prothoma.com/publisher/%E0%A6%85%E0%A6%A8%E0%A6%A8%E0%A7%8D%E0%A6%AF%E0%A6%BE-%E0%A6%AA%E0%A7%8D%E0%A6%B0%E0%A6%95%E0%A6%BE%E0%A6%B6%E0%A6%A8%E0%A7%80?page=#{page}"
  byebug
  pagination_unparsed_page = HTTParty.get(pagination_url)
  pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page.body)
  pagination_products = pagination_parsed_page.css('div.product_single')

  pagination_products.each  do|product|
    product ={
      title: product.css('h2').text,
      author: product.css('h3').text,
      original_price: product.css('span.price_2').text,
      discounted_price: product.css('span.price_1').text,
      url: product.css('a')[0].attributes["href"].text
    }
      product_array << product
  end
  page += 1
end
temp = {
      title: " ",
      author: "",
      original_price: " ",
      discounted_price: " ",
      url: " "
    }
#byebug


  CSV.open("#{publisher}.csv",'w') do |csv|
    csv << ['Title','Author','Original Price','Discounted Price','URL']
    product_array.each do |product|
      product = temp.merge(product)
      csv << CSV::Row.new(product.keys,product.values)
    end
  end
end
scraper
