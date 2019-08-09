class Generator

  def self.random_pokemon_number
    rand(1..(Scraper.all.length))
  end

  def self.random_nature_number
    rand(0..(Pokemon.natures.length-1))
  end


end

