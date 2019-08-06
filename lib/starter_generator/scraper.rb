require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  @@all = []

  def self.all
    @@all
  end

  def self.scrape_list_page
    # scraped = []
    url = open("https://www.serebii.net/pokemon/all.shtml")

    index_page = Nokogiri::HTML(url)

    # all = index_page.css("table.dextable tr:nth-of-type(1n+3) td:nth-of-type(3) a").text
    pokemon_scrape = index_page.css("table.dextable tr td:nth-of-type(3)").each do |pokemon|
      name = pokemon.css("a").text
      @@all << name
    end
    @@all.delete_if {|pokemon| pokemon == ""}
    @@all.delete_if.with_index { |pokemon, i| i > 720 }
    # @@all.delete_if {|pokemon| pokemon.index > 721}
  end


  def self.scrape_pokemon_page(number)
    if number < 10
      url_number = "00#{number.to_s}"
    elsif number < 100
      url_number = "0#{number.to_s}"
    elsif number > 100
      url_number = number.to_s
    else
      puts "error"
    end
    url = open("https://www.serebii.net/pokedex-xy/#{url_number}.shtml")
    index_page = Nokogiri::HTML(url)
    first_level = index_page.css("table:nth-of-type(2) tr:nth-of-type(2) td:nth-of-type(2) div:nth-of-type(2) div")
    description_array = []
    description_scrape = first_level.css("td.ruby").each do |text|
      words = text.css("~ td.fooinfo").text
      description_array << words
    end
    description = description_array[1]

    text_array = []
    type_scrape = first_level.css("td.cen a").each do |foo|
      type = foo.attribute("href").text
      text_array << type
    end
    types_array = text_array.select {|text| text.include?("pokedex-xy")}
    better_types_array = types_array.collect {|type| type.slice(12..-7)}

    type_test = type_scrape.slice(12..-7)


    #stick a hash in here at some point, and possible build these specific scrapes out as helper methods



  end

  #do it as a helper method instead?
  # def self.pokemon_number_formatter(pokemon_number)
  #   #turn Pokémon number to string, and if there aren't enough zeros, add them
  #   if pokemon_number < 10
  #     number = "00#{pokemon_number.to_s}"
  #   elsif pokemon_number < 100
  #     number = "0#{pokemon_number.to_s}"
  #   else
  #     number = pokemon_number.to_s
  #   end
  # end

end

#BULBAPEDIA

#index_page.css("table tr td a").text - gets literally all the Pokémon and types, mostly all in one word.
#could try to use regex to split it into an array and then exclude all words that are types? But then
#still get a bunch of garbage at the end

#index_page.css("table tr:nth-child(2) td:nth-child(4) a").text = "BulbasaurChikoritaTreeckoTurtwigVictiniChespinRowletGrookey"
#it's grabbing all of the Pokémon in tables in that position--so, all starters in each dex.

#SEREBII

#serebii test: serebii_test_2.css("table.dextable tr:nth-of-type(1n+3) td:nth-of-type(3) a").text
#serebii test 2: serebii_test_2.css("table.dextable tr td:nth-of-type(3) a").text

#index_page.css("table.dextable tr td:nth-of-type(3)").text
#gets: "\r\n\t\tName\t\r\n\t\tDef\r\n\t\tBulbasaur\r\n\t\t\r\n\t\tIvysaur\r\n\t\t\r\n\t\tVenusaur\r\n\t\t\r\n\t\tCharmander\r\n\t\t\r\n\t\tCharmeleon\r\n\t\t\r\n\t\tCharizard\r\n\t\t\r\n\t\tSquirtle"

#using Sun and Moon/Let's Go dex (BROKE because Serebii doesn't have descriptions for anything not in Let's Go):
# url = open("https://www.serebii.net/pokedex-sm/#{url_number}.shtml")
# index_page = Nokogiri::HTML(url)
# first_level = index_page.css("table:nth-of-type(2) tr:nth-of-type(2) td:nth-of-type(2) div:nth-of-type(2) div")
# array = []
# description_scrape = first_level.css("td.foopika").each do |text|
#   words = text.css("~ td.fooinfo").text
#   array << words
# end
