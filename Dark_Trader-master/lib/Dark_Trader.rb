require 'pry'
require 'open-uri'
require 'rubygems'
require 'nokogiri'


def currency

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

currency_list = []

change = page.xpath("//*[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price']/a")

change.each do |change|

currency_list << change.text

end

return currency_list

end



def list

page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

list_coin = []

name = page.xpath("//*[@class = 'cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol']/div")

	name.each do |name|

list_coin << name.text

end

return list_coin

end



def perform

x = 0
y = 0

currency_list = currency

list_coin = list

result = []

while x < currency_list.length

	result << "#{list_coin[y]} : #{currency_list[y]}"

	x += 1
	y += 1

	puts result
end

end

perform


