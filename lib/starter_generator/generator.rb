class Generator
  #class to take in Pokémon array made by Scraper and pick three to instantiate into Pokémon objects

  def self.random_number
    #generate a random number from 0-[Scraper.all_pokemon.length]
    rand(1..(Scraper.all_pokemon.length))
  end

  #should this be in the Pokémon class? Should Pokémon be responsible for creating themselves? Yes probably.
  def self.make_pokemon
    #use the number generated in the previous method to pick a Pokémon from that array
    #instantiate a new Pokémon object with the name and the number(+1)
  end
end
#rand(1..(Scraper.all_pokemon.length))
#rand(1..(Scraper.all_pokemon.length))
