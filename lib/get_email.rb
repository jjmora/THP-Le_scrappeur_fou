require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pry'

def get_townhall_email(townhall_url)
  doc = Nokogiri::HTML(open(townhall_url))
  value = doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
  value
end

#get_townhall_email('https://www.annuaire-des-mairies.com/95/avernes.html')


def get_townhall_urls()
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  links = doc.css("a")
  towns_array = []
  (8...links.length-1).each do |x|
    towns_array.push("https://www.annuaire-des-mairies.com" + links[x]["href"][1..-1])
  end
  towns_array
end

#get_townhall_urls()

def get_towns_names()
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  links = doc.css("a")
  towns_array = []
  (8...links.length-1).each do |x|
    towns_array.push((links[x].text).capitalize)
  end
  towns_array
end

#get_towns_names()


def get_all_emails()
  towns_array = get_townhall_urls()
  final_array = []
  l = towns_array.length
  #l = 184
  (0...l).each do |x|
    email = get_townhall_email(towns_array[x])
    email != nil ? final_array.push(email) : final_array.push(' ')
  end
  final_array
end

#get_all_emails()

def data_ville_emails()
  hash = Hash.new
  temp_hash = Hash.new
  a = []
  towns_array = get_towns_names()
  all_emails = get_all_emails()
  l = towns_array.length
  (0...l).each do |x|
    temp_hash[towns_array[x]] = all_emails[x]
    a[x] = temp_hash
  end
  a
end

p data_ville_emails()


=begin

a = [
  { "ville_1" => "email_1" },
  { "ville_2" => "email_2" }, 
  etc
]

=end