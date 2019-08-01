How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects
8. program

- A command line interface for generating starter Pokémon, using Bulbapedia for stats

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

[more info from Bulbapedia]
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
