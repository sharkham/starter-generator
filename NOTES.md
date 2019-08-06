How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects
8. program

- A command line interface for generating starter Pokémon, using Serebii for stats

user types get-a-pokemon

- Show three starter Pokémon for the user to choose from

1. Bulbasaur - Grass Pokémon
2. Squirtle - Water Pokémon
3. Charmander - Fire Pokémon

choice 1: Which Pokémon would you like?

[user chooses]

confirm choice: Would you like Charmander?

[y/n]

y: Congratulations, you have chosen Charmander!
Would you like to learn more about this Pokémon?

[more info from Serebii]
[nature generator]
[level generator]

n: Which Pokémon would you like?

[back to list of three Pokémon; don't do the random generator again]


What is a Pokémon?

A Pokémon has a name
A Pokémon has a type
A Pokémon has a description
A Pokémon has a (randomly generated) nature
[bonus: A Pokémon has a (randomly generated) level]

Sorting out what goes where:

- Scraper class scrapes Pokémon list
- Pokémon class makes objects out of these Pokémon
- Something has to randomly pick 3
- These are displayed to user
- User picks a Pokémon
- Scraper class scrapes detail Pokémon pages

Current generator workflow:

- Scraper.scrape_list_page
#this needs to go first because it makes the array all the other methods use
- random = Pokemon.make_pokemon
#uses the array to generate a random Pokémon, including name, number and nature
- attributes = Scraper.scrape_pokemon_page(number_of_random)
#the number attribute from previously generated Pokémon is used to get the attributes
- random.add_scraped_attributes(attributes)
#return value of previous method is passed in as an argument here, and attributes are added to Pokémon object

