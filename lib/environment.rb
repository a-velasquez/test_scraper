require 'open-uri'
require 'nokogiri'
require 'byebug'
require 'colorize'

require_relative "test_scraper/cli.rb"
require_relative "test_scraper/article.rb"
require_relative "test_scraper/scraper.rb"
require_relative "test_scraper/version.rb"

module TestScraper
  class Error < StandardError; end
  # Your code goes here...
end
