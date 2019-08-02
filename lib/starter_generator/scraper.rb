require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  @@all_pokemon = []

  def self.all
    @@all_pokemon
  end

  def self.scrape_list_page
    # scraped_pokemon = []

    url = open("https://www.serebii.net/pokemon/all.shtml")

    index_page = Nokogiri::HTML(url)

    # all_pokemon = index_page.css("table.dextable tr:nth-of-type(1n+3) td:nth-of-type(3) a").text
    pokemon_scrape = index_page.css("table.dextable tr td:nth-of-type(3)").each do |pokemon|
      name = pokemon.css("a").text
      @@all_pokemon << name
    end
    @@all_pokemon.delete_if {|pokemon| pokemon == ""}
  end
  binding.pry

  def self.scrape_pokemon_page(pokemon_name)
    #scrape the individual pokémon's page
  end
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
