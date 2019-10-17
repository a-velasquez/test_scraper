require 'open-uri'
require 'nokogiri'
require 'byebug'

require_relative "test_scraper/cli"
require_relative "test_scraper/article"
require_relative "test_scraper/scraper"
require_relative "test_scraper/version"

module TestScraper
  class Error < StandardError; end
  # Your code goes here...
end
