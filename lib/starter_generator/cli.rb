#Our CLI Controller

class StarterGenerator::CLI

  def call
    opening_message
    pokemon_options
    choose
    goodbye
  end

  #look up streams for delaying the thing running
  #need a method of waiting for a stream to complete before running the whole thing
  #see: promises in Javascript

  def opening_message
    puts "Welcome to the world of Pokémon!"
    puts "Adventure awaits!\n\n"
  end

  def pokemon_options
    puts "I have three Pokémon here looking for homes:"
    @starters = Pokemon.generated
    @starters.each.with_index(1) do |pokemon, i|
      puts "#{i}. #{pokemon.name}"
    end
  end

  def choose
    puts "Please tell me the number of the Pokémon you would like to adopt, or type list to see the Pokémon again, or type exit:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 4
        the_pokemon = @starters[input.to_i-1]
        puts "#{the_pokemon.name}"
      elsif input == "list"
        pokemon_options
      else
        puts "What was that? Please type list, exit, or a Pokémon number."
      end
    end
  end

  def goodbye
    puts "Farewell!"
  end

end
