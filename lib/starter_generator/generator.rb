module Generator
  #class to take in Pokémon array made by Scraper and pick three to instantiate into Pokémon objects

  def self.random_number
    #generate a random number from 0-[Scraper.all_pokemon.length]
    rand(1..(Scraper.all.length))
  end

end

