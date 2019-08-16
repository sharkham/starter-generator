class StarterGenerator::CLI

  def call
    opening_message
    generate_starters
    display_pokemon_options
    choose
    goodbye
  end

  def opening_message
    puts "------------------------------".colorize(:color => :red, :background => :red)
    puts "------------------------------".colorize(:color => :red, :background => :red)
    puts "           P. P. S.           ".colorize(:color => :white, :background => :black)
    puts "------------------------------".colorize(:color => :white, :background => :white)
    puts "------------------------------".colorize(:color => :white, :background => :white)
    puts "\n"
    puts "Welcome to the " + "Pokémon Protection Society".colorize(:color => :light_blue) + "'s online portal!\n\n"
    puts "The PPS was founded to care for and find homes for unwanted or abandoned " + "Pokémon".colorize(:light_blue) + "."
    puts "\n"
    puts "Please wait while we check our records for available " + "Pokémon".colorize(:light_blue) + ".\n"
  end

  def generate_starters
    pokemon_list = StarterGenerator::Scraper.scrape_list_page
    StarterGenerator::Pokemon.make_three_pokemon(pokemon_list)
  end

  def display_pokemon_options
    puts "\n"
    puts "------------------------------".colorize(:color => :red, :background => :red) + "\n"
    puts "\n"
    puts "I have three Pokémon here looking for homes:"
    StarterGenerator::Pokemon.all.each.with_index(1) do |pokemon, i|
      puts "  #{i}. " + "#{pokemon.name}".colorize(:light_blue)
    end
    puts "\n"
    puts "------------------------------".colorize(:color => :red, :background => :red) + "\n"
  end

  def choose
    @adopt = false
    puts "\nPlease tell me the number of the Pokémon you would like more information about, or type " + "exit".colorize(:green) + " to leave:"
    input = nil
    while input != "exit" && @adopt == false
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 4
        the_pokemon = StarterGenerator::Pokemon.all[input.to_i-1]
        more_info(the_pokemon)
        print_pokemon_info(the_pokemon)
        adopt?(the_pokemon)
      elsif input == "list"
        display_pokemon_options
      elsif input == "exit"
      else
        puts "What was that? Please type " + "list".colorize(:green) + " to see the list again, " + "exit".colorize(:green) + ", or a Pokémon number."
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
    puts "Would you like to adopt this Pokémon? " + "(y/n)".colorize(:green)
    adopt_input = nil
    while adopt_input != "y" && adopt_input != "n"
      adopt_input = gets.strip.downcase
      if adopt_input == "y"
        puts "\n"
        puts "------------------------------".colorize(:color => :red, :background => :red) + "\n"
        puts "\nCongratulations! You are now the proud trainer of" + " #{pokemon.name}".colorize(:light_blue) + "."
        puts "Please treat it well.\n\n"
        @adopt = true
      elsif adopt_input == "n"
        display_pokemon_options
      else
        puts "What was that? Please type" + " y".colorize(:green) + " or " + "n".colorize(:green) + "."
      end
    end
    @adopt
  end

  def more_info(pokemon)
    if pokemon.description == nil
      attributes = StarterGenerator::Scraper.scrape_pokemon_page(pokemon.number)
      pokemon.add_scraped_attributes(attributes)
    end
  end

  def print_pokemon_info(pokemon)
    puts "\n"
    puts "Name: ".colorize(:light_blue) + "#{pokemon.name}\n\n"
    puts "Number: ".colorize(:light_blue) + "#{StarterGenerator::Scraper.number_conversion(pokemon.number)}\n\n"
    puts "Type: ".colorize(:light_blue) + "#{pokemon.type}\n\n"
    puts "Description: ".colorize(:light_blue) + "#{pokemon.description}\n\n"
    puts "Nature: ".colorize(:light_blue) + "#{pokemon.nature}\n\n"
  end



end
