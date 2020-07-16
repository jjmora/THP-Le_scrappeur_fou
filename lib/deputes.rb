require 'rubygems'
require 'open-uri'
require 'nokogiri'

def get_list_depute_url()
  doc = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
  links = doc.xpath("//*[@id='deputes-list']//a")
  l = links.length
  links_array = []
  (1...l).each do |x|
    if links[x].text != "" 
      value = 'http://www2.assemblee-nationale.fr'+(links[x]['href'])
      links_array.push(value)
    end
  end
  links_array
end

get_list_depute_url()


def get_data_from_one_depute(index)
  url = index
  doc = Nokogiri::HTML(open(url))
  email = doc.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a").text

  full_name = doc.xpath("/html/body/div/div[3]/div/div/div/section[1]/div/article/div[2]/h1").text.split.drop(1)
  name = full_name[0]
  last_name = full_name[1]

  hash = Hash.new
  hash["first_name"] = name
  hash["last_name"] = last_name
  hash["email"] = email
  hash
end

#get_data_from_one_depute()


def final_data() 
  data = []
  links_array = get_list_depute_url()
  l = links_array.length
  (0...l).each do |x|
    index = links_array[x]
    data.push(get_data_from_one_depute(index))
  end
  data
end

p final_data()
=begin
a = [
  { 
    "first_name" => "Jean",
    "last_name" => "Durant",
    "email" => "jean.durant@assemblée.fr"
  },
  { 
    "first_name" => "Martin",
    "last_name" => "Dupont",
    "email" => "martin.dupont@assemblée.fr"
  },
  etc
]


=end