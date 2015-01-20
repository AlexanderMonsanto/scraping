require 'nokogiri'
require 'open-uri'
require 'awesome_print'

# url = open('index.html')
url = open("http://www.xpn.org/events/concert-calendar")

data = Nokogiri::HTML(url)
final_data = []

#Parsing the data
data.css("tbody tr").each do |row|

  row_item = row.css("td").map do |item|
    item.text
  end

  final_data << row_item

end

#Getting it ready for the db
  mapped_data = final_data.map do |row|
    {
      day: row[0],
      date: row[1],
      artist: row[2],
      venue: row[3],
      price: row[4],
      sale: row[5],
      link: row[6]
    }

    # ap row_ite

end

 ap mapped_data
