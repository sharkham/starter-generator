require "spec_helper"

describe "Pokemon" do
  let(:pokemon) { Pokemon.new("Tyranitar", 248, "Naughty") }

  describe "#initialize" do
    it "accepts a name for the new pokemon" do
      new_pokemon = Pokemon.new("Litwick", 607, "Mild")

      new_pokemon_name = new_pokemon.instance_variable_get(:@name)

      expect(new_pokemon_name).to eq("Litwick")
    end
    it "accepts a number for the new pokemon" do
      new_pokemon_2 = Pokemon.new("Bulbasaur", 1, "Timid")

      new_pokemon_number = new_pokemon_2.instance_variable_get(:@number)

      expect(new_pokemon_number).to eq(1)
    end
  end

  describe "#name" do
    it "retrieves the name of a pokemon" do
      expect(pokemon.name).to eq("Tyranitar")
    end
  end

  describe "#name=" do
    it "can set the name of a pokemon" do
      pokemon.name = "Litwick"

      pokemon_name = pokemon.instance_variable_get(:@name)

      expect(pokemon_name).to eq("Litwick")
    end
  end

  describe "#nature=" do
  it "can set the nature of a pokemon" do
    pokemon.nature = "Mild"

    pokemon_nature = pokemon.instance_variable_get(:@nature)

    expect(pokemon_nature).to eq("Mild")
  end
end

  describe "@@all" do
    it "is initialized as an empty array" do
      all = Pokemon.class_variable_get(:@@all)

      expect(all).to match_array([])
    end
  end

  describe ".all" do
    it "returns the class variable @@all" do
      expect(Pokemon.all).to match_array([])

      Pokemon.class_variable_set(:@@all, [pokemon])

      expect(Pokemon.all).to match_array([pokemon])
    end
  end

  describe "#save" do
    it "adds the Pokemon instance to the @@all class variable" do
      pokemon.save

      expect(Pokemon.all).to include(pokemon)
    end
  end

  describe ".create" do
    it "initializes, saves, and returns the pokemon" do
      created_pokemon = Pokemon.create("Charmander", 4, "Bold")

      expect(Pokemon.all).to include(created_pokemon)
    end
  end

end
