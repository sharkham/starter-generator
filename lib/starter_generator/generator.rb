class StarterGenerator::Generator

  def self.random_pokemon_number(pokemon_list)
    rand(1..(pokemon_list.length))
  end

  def self.random_nature_number
    rand(0..(StarterGenerator::Pokemon.natures.length-1))
  end


end

