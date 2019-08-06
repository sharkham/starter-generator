#Our CLI Controller

class StarterGenerator::CLI

  def call
    opening_message
    generate_list
    make_three_pokemon
    pokemon_options
    choose
    more_info
    goodbye
  end

  #look up streams for delaying the thing running
  #need a method of waiting for a stream to complete before running the whole thing
  #see: promises in Javascript

  def opening_message
    puts "Welcome to the Pokémon Protection Society's online portal!"
    puts "Please wait while we check our records for available Pokémon.\n\n"
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
    puts "I have three Pokémon here looking for homes:"
    @pokemon.each.with_index(1) do |pokemon, i|
      puts "#{i}. #{pokemon.name}"
    end
    # @starters = Pokemon.generated
    # @starters.each.with_index(1) do |pokemon, i|
    #   puts "#{i}. #{pokemon.name}"
    # end
  end

  def choose
    puts "Please tell me the number of the Pokémon you would like more information about, or type list to see the Pokémon again, or type exit:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 4
        the_pokemon = @pokemon[input.to_i-1]
        more_info(the_pokemon)
        print_pokemon_info(the_pokemon)
        #this breaks my going back to list or exit! It says it's running more_info and needs an argument?

        # puts "#{the_pokemon.name}"
      elsif input == "list"
        pokemon_options
      elsif input == "exit"
        #this isn't working--something needs to happen here. Break? We don't wanna use that though.
      else
        puts "What was that? Please type list, exit, or a Pokémon number."
        #this is an error--this comes up when you input "exit" and then it does "goodbye"
      end
    end
  end

  def more_info(pokemon)
    attributes = Scraper.scrape_pokemon_page(pokemon.number)
    pokemon.add_scraped_attributes(attributes)
  end

  def print_pokemon_info(pokemon)
    puts "  Name: #{pokemon.name}"
    puts "  Number: #{pokemon.number}"
    #make sure the number thing is formatted properly here so it reads right.
    puts "  Type: #{pokemon.type}"
    #this needs to not be an array here
    puts "  Description: #{pokemon.description}"
    puts "  This Pokémon has a #{pokemon.nature} nature."
  end

  def goodbye
    puts "Thank you for visiting us today!"
  end

end
