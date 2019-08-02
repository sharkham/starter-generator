class Generator
  #class to take in Pokémon array made by Scraper and pick three to instantiate into Pokémon objects

  def self.random_number
    #generate a random number from 0-[Scraper.all_pokemon.length]
    rand(1..(Scraper.all.length))
  end

  #should this be in the Pokémon class? Should Pokémon be responsible for creating themselves? Yes probably.
  def self.make_pokemon
    number = self.random_number
    pokemon = Scaper.all[number-1]
    #use the number generated in the previous method to pick a Pokémon from that array
    #instantiate a new Pokémon object with the name and the number(+1)
  end

  def self.get_three
    #make the Pokémon in the Pokémon class and then make three here? Idk
  end
end

