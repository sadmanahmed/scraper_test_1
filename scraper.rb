require 'nokogiri'
require 'httparty'
require 'byebug'
require 'csv'
require 'pry'
def scraper

url = "https://rokomari.com/book/publisher/369/seba-prokashony?ref=mm_p5&page=1"
unparsed_page = HTTParty.get(url)
parsed_page = Nokogiri::HTML(unparsed_page.body)

product_array = Array.new

products = parsed_page.css('div.book-list-wrapper')

per_page = products.count
page = 1
total_products = parsed_page.css('div.col-lg-12').text.split(' ')[-2].to_i

last_page = 1+ (total_products.to_f / per_page.to_f).ceil(5)
n=0
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
      url: "https://rokomari.com/"+product.css('a')[0].attributes["href"].value
    }
    #product_array << product
    #puts "Added Title : #{product[:title]}"
    #puts " "

    book_url = product[:url]
    book_unparsed_page = HTTParty.get(book_url)
    book_parsed_page = Nokogiri::HTML(book_unparsed_page.body)

      book = {
        summary: book_parsed_page.css('div.details-book-additional-info__content-summery.truncate').text.gsub(/\n/,"").strip
      }

      pro = product.merge(book)
      product_array << pro

      #byebug
  end

  page += 1
end
#byebug
#binding.pry
#byebug
CSV.open('test.csv','w') do |csv|


    csv << ['Title','Author','Original Price','Discounted Price','URL','Summary']
    product_array.each do |product|
      csv << CSV::Row.new(product.keys,product.values)
    end


  end
end
scraper
# book_url = product_array[0][:url]
      # book_unparsed_page = HTTParty.get(book_url)
      # book_parsed_page = Nokogiri::HTML(book_unparsed_page.body)
      # book_spec = book_parsed_page.css('div.details-book-additional-info__content-summery.truncate').text.gsub(/\n/,"").strip
      # book_author = book_parsed_page.css('div.col.author_des').text.strip.delete_suffix('Read More').strip
