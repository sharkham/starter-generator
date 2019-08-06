#Our CLI Controller

class StarterGenerator::CLI

  def call
    opening_message
    generate_list
    # chill
    make_three_pokemon
    pokemon_options
    choose
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
    #find some way to delay other things until this happens!
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
        #this is where I want to use this to do a different method that's populating the Pokémon object
        puts "#{the_pokemon.name}"
      elsif input == "list"
        pokemon_options
      else
        puts "What was that? Please type list, exit, or a Pokémon number."
        #this is an error--this comes up when you input "exit" and then it does "goodbye"
      end
    end
  end

  def goodbye
    puts "Thank you for visiting us today!"
  end

end
