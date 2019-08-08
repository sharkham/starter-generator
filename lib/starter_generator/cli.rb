#Our CLI Controller
require 'colorize'

class StarterGenerator::CLI
  # include Formattable
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
    puts "------------------------------".colorize(:color => :red, :background => :red)
    puts "------------------------------".colorize(:color => :red, :background => :red)
    puts "           P. P. S.           ".colorize(:color => :white, :background => :black)
    puts "------------------------------".colorize(:color => :white, :background => :white)
    puts "------------------------------".colorize(:color => :white, :background => :white)
    puts "\n"
    puts "Welcome to the " + "Pokémon Protection Society".colorize(:color => :light_blue) + "'s online portal!\n\n"
    puts "The PPS was founded to care for and find homes for unwanted or abandoned " + "Pokémon".colorize(:light_blue) + "."
    # puts "Most of the Pokémon here were surrendered by trainers, rescued from situations of abuse,"
    # puts "or can no longer survive in the wild for other reasons."
    # puts "We take in Pokémon surrendered by trainers, rescue Pokémon from situations of abuse,"
    # puts "and bring in abandoned Pokémon who can no longer live in the wild."
    puts "\n"
    #have some more lines about the PPS here to read while the Pokémon generate.
    # puts "Congratulations on passing our adoption checks!"
    puts "Please wait while we check our records for available " + "Pokémon".colorize(:light_blue) + ".\n\n"
    puts "------------------------------".colorize(:color => :red, :background => :red) + "\n"
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
      puts "  #{i}. " + "#{pokemon.name}".colorize(:light_blue)
    end
    puts "\n"
    puts "------------------------------".colorize(:color => :red, :background => :red) + "\n"
    # @starters = Pokemon.generated
    # @starters.each.with_index(1) do |pokemon, i|
    #   puts "#{i}. #{pokemon.name}"
    # end
  end

  def choose
    @adopt = false
    puts "\nPlease tell me the number of the Pokémon you would like more information about, or type " + "exit".colorize(:light_blue) + " to leave:"
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
        puts "What was that? Please type " + "list".colorize(:light_blue) + " to see the list again, " + "exit".colorize(:light_blue) + ", or a Pokémon number."
      end
    end
  end

  def goodbye
    puts "Thank you for visiting us today!"
    puts "\n"
    puts "------------------------------".colorize(:color => :red, :background => :red) + "\n"
  end

  #Helper methods:

  def adopt?(pokemon)
    puts "Would you like to adopt this Pokémon? " + "(y/n)".colorize(:light_blue)
    input = gets.strip.downcase
    if input == "y"
      puts "\n"
    puts "------------------------------".colorize(:color => :red, :background => :red) + "\n"
      puts "\nCongratulations! You are now the proud trainer of" + " #{pokemon.name}".colorize(:light_blue) + "."
      puts "Please treat it well.\n\n"
      @adopt = true
    elsif input == "n"
      puts "\n"
    puts "------------------------------".colorize(:color => :red, :background => :red) + "\n"
      pokemon_options
    else
      puts "What was that? Please type" + " y".colorize(:light_blue) + " or " + "n".colorize(:light_blue) + "."
    end
    @adopt
  end

  def more_info(pokemon)
    attributes = Scraper.scrape_pokemon_page(pokemon.number)
    pokemon.add_scraped_attributes(attributes)
  end

  def print_pokemon_info(pokemon)
    puts "\n"
    puts "Name: ".colorize(:light_blue) + "#{pokemon.name}\n\n"
    puts "Number: ".colorize(:light_blue) + "#{Scraper.number_conversion(pokemon.number)}\n\n"
    #Given its use here; the number conversion maybe shouldn't be in the Scraper class. A module?
    puts "Type: ".colorize(:light_blue) + "#{pokemon.type}\n\n"
    #this needs to not be an array here
    puts "Description: ".colorize(:light_blue) + "#{pokemon.description}\n\n"
    puts "Nature: ".colorize(:light_blue) + "#{pokemon.nature}\n\n"
  end



end
