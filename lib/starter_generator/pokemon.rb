

class StarterGenerator::Pokemon
  attr_accessor :name, :type, :description, :nature, :level
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.generated
    #should return three instances of Pokémon
    # puts "1. Tyranitar"
    # puts "2. Litwick"
    # puts "3. Sunkern"

    pokemon_1 = self.new("Test")
    pokemon_1.name = "Tyranitar"
    pokemon_1.type = "Rock/Dark"
    pokemon_1.description = "Beautiful big boy."
    pokemon_1.nature = "Adamant"
    pokemon_1.level = "60"

    pokemon_2 = self.new("Test")
    pokemon_2.name = "Litwick"
    pokemon_2.type = "Ghost/Fire"
    pokemon_2.description = "Smol candle friend."
    pokemon_2.nature = "Lonely"
    pokemon_2.level = "20"

    pokemon_3 = self.new("Test")
    pokemon_3.name = "Sunkern"
    pokemon_3.type = "Grass"
    pokemon_3.description = "Happy plant."
    pokemon_3.nature = "Lazy"
    pokemon_3.level = "15"

    [pokemon_1, pokemon_2, pokemon_3]
  end

end


