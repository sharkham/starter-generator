# StarterGenerator

Welcome to the wonderful world of Pokémon! This gem generates three starter Pokémon for you to choose from to begin your Pokémon journey, up to and including Generation VI, as well as some Pokémon in Generation VII. 'Starter' Pokémon here could be any Pokémon from these generations, including evolved forms or legendaries; you're accessing them through the Pokémon World's version of the human society, the Pokémon Protection Society.

As well as generating three random Pokémon for you to choose from, this gem also gives you information on the Pokémon's type, Pokédex entry (from Omega Ruby or Sun) and randomly generates a nature.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'starter_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install starter_generator

## Usage

After downloading, navigate in your terminal to the `starter_generator` directory then type `bin/run` to start the program.

If you'd like to use this program to generate random Pokémon up to an earlier generation, there are instructions on how to (slightly!) alter the code to do that in the `lib/starter_generator/scraper.rb` file.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. (Please note that the tests are unfinished, and only test part of the `Pokemon` class). You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sharkham/starter_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the StarterGenerator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sharkham/starter_generator/blob/master/CODE_OF_CONDUCT.md).
