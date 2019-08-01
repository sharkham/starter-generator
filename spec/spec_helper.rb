require "bundler/setup"
require "starter_generator"

#error is:
#Traceback (most recent call last):
        #2: from ./spec/pokemon_spec.rb:1:in `<main>'
        #1: from /Users/sammarkham/.rvm/rubies/ruby-2.6.1/lib/ruby/site_ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
#/Users/sammarkham/.rvm/rubies/ruby-2.6.1/lib/ruby/site_ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require': cannot load such file -- spec_helper (LoadError)

#This is what I tried to add to fix it:
# require_relative "../lib/environment"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
