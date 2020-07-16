require 'rubygems'
require 'open-uri'
require 'nokogiri'


def get_hash_one_crypto(array, doc, iterator)
  key = doc.xpath("/html/body/div[1]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{iterator}]/td[2]/div/a").text

  value = doc.xpath("/html/body/div/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{iterator}]/td[5]/a").text
  temp_hash = Hash.new
  temp_hash[key] = value
  array.push(temp_hash)
end


def get_crypto_values()
  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  hash = Hash.new
  cryptos = []
  (1..200).each do |i|
    get_hash_one_crypto(cryptos, doc, i)
  end
  cryptos
end


############# TESTS
def check_get_hash_one_crypto()
  hash = Hash.new
  arr = get_crypto_values(1)
  hash = arr[0]
  hash_key = hash.keys[0]
  check_array = []
  check_array[0] = hash_key != nil ? true : false
  check_array[1] = hash[hash_key] != nil ? true : false
  check_array
end


def check_if_cryptos(crypto1, crypto2, crypto3, number)
  array = get_crypto_values(number)
  count = 0
  (0...array.length).each do |i|
    array[i].keys[0] == crypto1 ? count += 1 : 0
    array[i].keys[0] == crypto2 ? count += 1 : 0
    array[i].keys[0] == crypto3 ? count += 1 : 0
  end
  count
end


def check_if_name_exists(crypto)
  h = get_crypto_values(2)
  h[0].keys
end

def check_if_value_exists(crypto)
  h = get_crypto_values(2)
  h[0][crypto] ? true : false
end

def init
  puts "If you want to load the 200 Cryptos and values presh =>"
  puts "> A for an Array"
  puts "> L for a List"
  init = gets.chomp
  array = []
  if init == "A" 
    p get_crypto_values()
  end
  if init == "L" 
    puts get_crypto_values()
  end
end

init()