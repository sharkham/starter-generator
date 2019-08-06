class Generator
  #class to take in Pokémon array made by Scraper and pick three to instantiate into Pokémon objects

  def self.random_pokemon_number
    #generate a random number from 0-[Scraper.all_pokemon.length]
    rand(1..(Scraper.all.length))
  end

  def self.random_nature_number
    rand(0..(Pokemon.natures.length-1))
  end

  #This might not be separating concerns enough
  #might need to make this do the number and set the nature in the Pokémon class
  # def self.random_nature
  #   Pokemon.natures[rand(0..(Pokemon.natures.length-1))]
  # end

end

