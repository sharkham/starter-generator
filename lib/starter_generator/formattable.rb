module Formattable
  #NOTE: the #wrap_word method is from https://medium.com/@eli.lauffenburger/wrap-word-a-simple-ruby-method-for-formatting-cli-output-in-terminal-b9887efffc7b
  #Used with permission given in the article.

  def wrap_word(input_string, given_width = 88)
    #<default value> to be replaced with an integer by user
    array_of_characters = input_string.split("")
    output_string = []
    counter_variable = 0
    array_of_characters.each do |character|
    #first check if the original character is a carriage return.
    #If so, reset the counter variable.
        if character == "\n"
            counter_variable = 0
    #if not, check if the counter is greater than the desired width,
    #also checking if the original character is a space.
    #if so, replace it with a carriage return.
        elsif counter_variable >= given_width && character == " "
            character = "\n"
            counter_variable = 0
        end
        output_string << character
        counter_variable += 1
    end
    return output_string.join("").to_s
  end

end
