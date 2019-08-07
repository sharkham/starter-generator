

class Pokemon
  attr_accessor :name, :number, :type, :description, :nature
  @@all = []
  def initialize(name, number, nature)
    @name = name
    @number = number
    @nature = nature
  end

  def save
    Pokemon.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    Pokemon.all.clear
  end

  def self.create(name, number, nature)
    pokemon = Pokemon.new(name, number, nature)
    pokemon.save
    pokemon
  end

  def self.random_number
    #generate a random number from 0-[Scraper.all_pokemon.length]
    rand(1..(Scraper.all.length))
  end

  #should this be in the Pokémon class? Should Pokémon be responsible for creating themselves? Yes probably.
  def self.make_pokemon
    number = Generator.random_pokemon_number
    name = Scraper.all[number-1]
    nature = self.natures[Generator.random_nature_number]
    self.create(name, number, nature)
    #use the number generated in the previous method to pick a Pokémon from that array
    #instantiate a new Pokémon object with the name and the number(+1) and randomly generated nature
  end

  def self.natures
    @@natures = ["Hardy", "Lonely", "Brave", "Adamant", "Naughty", "Bold", "Docile", "Relaxed", "Impish", "Lax", "Timid", "Hasty", "Serious", "Jolly", "Naïve", "Modest", "Mild", "Quiet", "Bashful", "Rash", "Calm", "Gentle", "Sassy", "Careful", "Quirky"]
  end

  def add_scraped_attributes(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    self
  end

  def self.generated
    #should return three instances of Pokémon
    #scrape Bulbapedia and return Pokémon generated through that list

    #THESE NEED TO BE COMMENTED OUT TO PASS TEST BUT ON TO RUN BIN/RUN

    # pokemon_1 = self.new("Test", 3)
    # pokemon_1.name = "Tyranitar"
    # pokemon_1.type = "Rock/Dark"
    # pokemon_1.description = "Beautiful big boy."
    # pokemon_1.nature = "Adamant"
    # pokemon_1.level = "60"

    # pokemon_2 = self.new("Test", 4)
    # pokemon_2.name = "Litwick"
    # pokemon_2.type = "Ghost/Fire"
    # pokemon_2.description = "Smol candle friend."
    # pokemon_2.nature = "Lonely"
    # pokemon_2.level = "20"

    # pokemon_3 = self.new("Test", 5)
    # pokemon_3.name = "Sunkern"
    # pokemon_3.type = "Grass"
    # pokemon_3.description = "Happy plant."
    # pokemon_3.nature = "Lazy"
    # pokemon_3.level = "15"

    # [pokemon_1, pokemon_2, pokemon_3]
  end

end


