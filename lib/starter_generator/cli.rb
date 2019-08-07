#Our CLI Controller
require 'colorize'

class StarterGenerator::CLI

  def call
    opening_message
    generate_list
    make_three_pokemon
    pokemon_options
    choose
    goodbye
  end

  #look up streams for delaying the thing running
  #need a method of waiting for a stream to complete before running the whole thing
  #see: promises in Javascript

  def opening_message
    puts "------------------------------"
    puts "|          P. P. S.          |"
    puts "------------------------------"
    puts "\n"
    puts "Welcome to the Pokémon Protection Society's online portal!"
    puts "The PPS was founded to care for and find homes for unwanted or abandoned Pokémon."
    puts "[more info]"
    puts "\n"
    #have some more lines about the PPS here to read while the Pokémon generate.
    puts "Please wait while we check our records for available Pokémon.\n"
    puts "------------------------------\n"
  end

  def generate_list
    Scraper.scrape_list_page
  end

  def make_three_pokemon
    @pokemon = []
    pokemon_1 = Pokemon.make_pokemon
    pokemon_2 = Pokemon.make_pokemon
    pokemon_3 = Pokemon.make_pokemon
    @pokemon << pokemon_1
    @pokemon << pokemon_2
    @pokemon << pokemon_3
  end

  def pokemon_options
    puts "\n"
    puts "I have three Pokémon here looking for homes:"
    @pokemon.each.with_index(1) do |pokemon, i|
      puts "  #{i}. #{pokemon.name}"
    end
    # @starters = Pokemon.generated
    # @starters.each.with_index(1) do |pokemon, i|
    #   puts "#{i}. #{pokemon.name}"
    # end
  end

  def choose
    @adopt = false
    puts "\nPlease tell me the number of the Pokémon you would like more information about, or type exit to leave:"
    input = nil
    while input != "exit" && @adopt == false
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 4
        the_pokemon = @pokemon[input.to_i-1]
        more_info(the_pokemon)
        print_pokemon_info(the_pokemon)
        adopt?(the_pokemon)
      elsif input == "list"
        pokemon_options
      elsif input == "exit"
      else
        puts "What was that? Please type list to see the list again, exit, or a Pokémon number."
      end
    end
  end

  def goodbye
    puts "Thank you for visiting us today!"
  end

  #Helper methods:
  def adopt?(pokemon)
    puts "Would you like to adopt this Pokémon? (y/n)"
    input = gets.strip.downcase
    if input == "y"
      puts "\nCongratulations! You are now the proud trainer of #{pokemon.name}."
      puts "Please treat it well.\n\n"
      @adopt = true
    elsif input == "n"
      pokemon_options
    else
      puts "What was that? Please type y or n."
    end
    @adopt
  end

  def more_info(pokemon)
    attributes = Scraper.scrape_pokemon_page(pokemon.number)
    pokemon.add_scraped_attributes(attributes)
  end

  def print_pokemon_info(pokemon)
    puts "\n"
    puts "Name: #{pokemon.name}\n\n"
    puts "Number: #{Scraper.number_conversion(pokemon.number)}\n\n"
    #Given its use here; the number conversion maybe shouldn't be in the Scraper class. A module?
    puts "Type: #{pokemon.type}\n\n"
    #this needs to not be an array here
    puts "Description: #{pokemon.description}\n\n"
    puts "Nature: #{pokemon.nature}\n\n"
  end



end
