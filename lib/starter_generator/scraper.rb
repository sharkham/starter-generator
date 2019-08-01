require 'nokogiri'
require 'open-uri'
require 'pry'

class StarterGenerator::Scraper
  def self.scrape_list_page
    scraped_pokemon = []
    #this bit maybe shouldn't be hardcoded but not sure how else to do it since scraper is only good for this site
    url = open("https://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number")
    index_page = Nokogiri::HTML(url)
    binding.pry
    index_page.css(table[align="center"])
  end

  def self.scrape_pokemon_page(pokemon_name)
    #scrape the individual pokémon's page
  end
end

