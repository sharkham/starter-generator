class StarterGenerator::Pokemon
  attr_accessor :name, :number, :type, :description, :nature
  @@all = []
  def initialize(name, number, nature)
    @name = name
    @number = number
    @nature = nature
  end

  def save
    StarterGenerator::Pokemon.all << self
  end

  def self.all
    @@all
  end

  def self.create(name, number, nature)
    pokemon = StarterGenerator::Pokemon.new(name, number, nature)
    pokemon.save
    pokemon
  end

  def self.make_pokemon(pokemon_list)
    #randomly generated number
    number = StarterGenerator::Generator.random_pokemon_number(pokemon_list)
    #uses the Pokémon's number generated above to grab the corresponding name from the array of scraped Pokémon
    name = pokemon_list[number-1]
    #randomly generated nature
    nature = self.natures[StarterGenerator::Generator.random_nature_number]
    self.create(name, number, nature)
  end

  def self.make_three_pokemon(pokemon_list)
    3.times do
      self.make_pokemon(pokemon_list)
    end
  end

  def self.natures
    @@natures = ["Hardy", "Lonely", "Brave", "Adamant", "Naughty", "Bold", "Docile", "Relaxed", "Impish", "Lax", "Timid", "Hasty", "Serious", "Jolly", "Naïve", "Modest", "Mild", "Quiet", "Bashful", "Rash", "Calm", "Gentle", "Sassy", "Careful", "Quirky"]
  end

  def add_scraped_attributes(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    self
  end

end


