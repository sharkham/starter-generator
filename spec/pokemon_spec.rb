require "spec_helper"

describe "Pokemon" do
  let(:pokemon) { Pokemon.new("Tyranitar", 248) }

  describe "#initialize" do
    it "accepts a name for the new pokemon" do
      new_pokemon = Pokemon.new("Litwick", 607)

      new_pokemon_name = new_pokemon.instance_variable_get(:@name)

      expect(new_pokemon_name).to eq("Litwick")
    end
    it "accepts a number for the new pokemon" do
      new_pokemon_2 = Pokemon.new("Bulbasaur", 1)

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

  describe ".destroy_all" do
    it "resets the @@all class variable to an empty array" do
      Pokemon.class_variable_set(:@@all, [pokemon])

      Pokemon.destroy_all

      expect(Pokemon.all).to match_array([])
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
      created_pokemon = Pokemon.create("Charmander", 4)

      expect(Pokemon.all).to include(created_pokemon)
    end
  end

  #This test is from student scraper: I want to add Pokémon attributes later.
  # describe "#add_student_attributes" do
  #   it "uses the Scraper class to get a hash of a given students attributes and uses that hash to set additional attributes for that student." do
  #     student.add_student_attributes(student_hash)
  #     expect(student.bio).to eq("I was in southern California for college (sun and In-n-Out!), rural Oregon for high school (lived in a town with 1500 people and 3000+ cows), and Tokyo for elementary/middle school.")
  #     expect(student.blog).to eq("someone@blog.com")
  #     expect(student.linkedin).to eq("someone@linkedin.com")
  #     expect(student.profile_quote).to eq("\"Forget safety. Live where you fear to live. Destroy your reputation. Be notorious.\" - Rumi")
  #     expect(student.twitter).to eq("someone@twitter.com")
  #   end
  # end
end
