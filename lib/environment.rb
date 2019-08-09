require_relative "./starter_generator/version"
require_relative "./starter_generator/cli"
require_relative "./starter_generator/pokemon"
require_relative "./starter_generator/scraper"
require_relative "./starter_generator/generator"
# require_relative "./starter_generator/formattable"
require 'pry'
require 'colorize'
require 'nokogiri'
require 'open-uri'

module StarterGenerator
  class Error < StandardError; end
  # Your code goes here...
end
