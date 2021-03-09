require 'nokogiri'
require 'httparty'
require 'byebug'
require 'csv'

def scraper

url = "https://rokomari.com/book/publisher/369/seba-prokashony?ref=mm_p5&page=1"
unparsed_page = HTTParty.get(url)
parsed_page = Nokogiri::HTML(unparsed_page.body)

product_array = Array.new

products = parsed_page.css('div.book-list-wrapper')

per_page = products.count
page = 1
total_products = parsed_page.css('div.col-lg-12').text.split(' ')[-2].to_i

last_page = (total_products.to_f / per_page.to_f).ceil(5)

while page <= last_page

  pagination_url = "https://rokomari.com/book/publisher/369/seba-prokashony?ref=mm_p5&page=#{page}"
  pagination_unparsed_page = HTTParty.get(pagination_url)
  pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page.body)
  pagination_products = pagination_parsed_page.css('div.book-list-wrapper')



  pagination_products.each  do|product|
    product ={
      title: product.css('p.book-title').text,
      author: product.css('p.book-author').text,
      original_price: product.css('strike.original-price.pl-2').text,
      discounted_price: product.css('span').text,
      url: product.css('a')[0].attributes["href"].value
    }
    product_array << product
    #puts "Added Title : #{product[:title]}"
    #puts " "
  end
  page += 1
end
#byebug
CSV.open('test.csv','w') do |csv|


    csv << ['Title','Author','Original Price','Discounted Price','URL']
    product_array.each do |product|
      csv << CSV::Row.new(product.keys,product.values)
    end


  end
end
scraper
