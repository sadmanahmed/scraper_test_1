require 'nokogiri'
require 'httparty'
require 'byebug'
require 'csv'
#require 'pry'
require 'selenium-webdriver'
require 'language_converter'
def scraper

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://www.prothoma.com/publisher/%E0%A6%85%E0%A6%A8%E0%A6%A8%E0%A7%8D%E0%A6%AF%E0%A6%BE-%E0%A6%AA%E0%A7%8D%E0%A6%B0%E0%A6%95%E0%A6%BE%E0%A6%B6%E0%A6%A8%E0%A7%80?page=1"
a = driver.find_elements(:class, "product-amount")[0].text.split(" ")[0]
total_product = lc(a,'en','bn').to_i
byebug


url = "https://www.prothoma.com/publisher/%E0%A6%85%E0%A6%A8%E0%A6%A8%E0%A7%8D%E0%A6%AF%E0%A6%BE-%E0%A6%AA%E0%A7%8D%E0%A6%B0%E0%A6%95%E0%A6%BE%E0%A6%B6%E0%A6%A8%E0%A7%80?page=1"
puts url

unparsed_page = HTTParty.get(url)
parsed_page = Nokogiri::HTML(unparsed_page.body)

product_array = Array.new

products = parsed_page.css('div.product_single')
#puts products.text

per_page = products.count
page = 1
total_products = parsed_page.css('span.product-amount').text.to_i
byebug
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
    #puts "Added Title : #{product[:title]}"
    #puts " "
    book_url = product[:url]
    book_unparsed_page = HTTParty.get(book_url)
    book_parsed_page = Nokogiri::HTML(book_unparsed_page.body)

      book = {
        summary: book_parsed_page.css('div.details-book-additional-info__content-summery.truncate').text.gsub(/\t\n\s+/,"").strip
      }

    book_perser = book_parsed_page.css('#book-additional-specification > table > tr')
    @book_summary = {}
    book_perser.each do |tr|
      label=tr.css('td[1]').text
      value=tr.css('td[2]').text.split(',').map { |s| s.strip }.join(',')
      scrap_info = { label => value }
      @book_summary=@book_summary.merge(scrap_info)
      #byebug
    end
    #byebug
      product = product.merge(book)
      product = product.merge(@book_summary)
      product_array << product

      #byebug
  end

  page += 1
end
temp = {
      title: " ",
      author: "",
      original_price: " ",
      discounted_price: " ",
      url: " ",
      summary: " ",
      "Title" => " ",
      "Author"=>" ",
      "Translator"=>" ",
      "Editor" => " ",
      "Publisher"=>" ",
      "ISBN"=>" ",
      "Edition"=>" ",
      "Number of Pages"=>" ",
      "Country"=>" ",
      "Language"=>" "


    }
#byebug
#binding.pry
#byebug
  CSV.open('sheba.csv','w') do |csv|


    csv << ['Title','Author','Original Price','Discounted Price','URL','Summary','Book_Title','Book_Author','Translator','Editor','Publisher','ISBN','Edition','Number Of Pages','Country','Language']
    product_array.each do |product|
      product = temp.merge(product)
      csv << CSV::Row.new(product.keys,product.values)
    end


  end
end
scraper

