require 'nokogiri'
require 'open-uri'

class StarterGenerator::Scraper
  def self.scrape_list_page(https://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number)
    scraped_pokemon = []
    #this bit maybe shouldn't be hardcoded but not sure how else to do it since scraper is only good for this site
    url = open(https://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number)
    index_page = Nokogiri::HTML(url)
    index_page.css
  end

  def self.scrape_pokemon_page(pokemon_name)
    #scrape the individual pokémon's page
  end
end
