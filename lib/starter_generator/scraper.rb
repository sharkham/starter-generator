require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  @@all = []

  def self.all
    @@all
  end

  def self.scrape_list_page
    url = open("https://www.serebii.net/pokemon/all.shtml")

    index_page = Nokogiri::HTML(url)

    pokemon_scrape = index_page.css("table.dextable tr td:nth-of-type(3)").each do |pokemon|
      name = pokemon.css("a").text
      @@all << name
    end
    @@all.delete_if {|pokemon| pokemon == ""}
    @@all.delete_if.with_index { |pokemon, i| i > 720 }
  end

  #Helper method to turn actual number into URL number
  def self.number_conversion(number)
    if number < 10
      url_number = "00#{number.to_s}"
    elsif number < 100
      url_number = "0#{number.to_s}"
    elsif number > 100
      url_number = number.to_s
    end
  end

  def self.scrape_pokemon_page(number)
    #Converting the number into URL number:
    url_number = self.number_conversion(number)

    attribute_hash = {}

    #First level scrape:
    url = open("https://www.serebii.net/pokedex-xy/#{url_number}.shtml")
    index_page = Nokogiri::HTML(url)
    first_level = index_page.css("table:nth-of-type(2) tr:nth-of-type(2) td:nth-of-type(2) div:nth-of-type(2) div")

    #Description scrape:
    description_array = []
    description_scrape = first_level.css("td.ruby").each do |text|
      words = text.css("~ td.fooinfo").text
      description_array << words
    end
    attribute_hash[:description] = description_array[1]

    #Type scrape:
    text_array = []
    type_scrape = first_level.css("td.cen a").each do |foo|
      type = foo.attribute("href").text
      text_array << type
    end

    #Type formatting:
    type_urls_array = text_array.select {|text| text.include?("pokedex-xy")}
    types_array = type_urls_array.collect {|type| type.slice(12..-7).capitalize!}
    if types_array.length == 2
      types_string = "#{types_array[0]} / #{types_array[1]}"
    else
      types_string = "#{types_array[0]}"
    end

    attribute_hash[:type] = types_string


    attribute_hash

  end


end
