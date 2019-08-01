#Our CLI Controller

class StarterGenerator::CLI

  def call
    opening_message
    pokemon_options
    choose
    goodbye
  end

  def opening_message
    puts "Welcome to the world of Pokémon!\n\n"
    puts "Adventure awaits!"
  end

  def pokemon_options
    puts "I have three Pokémon here looking for homes:"
    puts "1. Tyranitar"
    puts "2. Litwick"
    puts "3. Sunkern"
  end

  def choose
    puts "Please tell me the number of the Pokémon you would like to adopt, or type list to see the Pokémon again, or type exit:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "You would like to choose Tyranitar?"
      when "2"
        puts "You would like to choose Litwick?"
      when "3"
        puts "You would like to choose Sunkern?"
      when "list"
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
