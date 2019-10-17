require 'open-uri'
require 'nokogiri'
require 'byebug'

require "test_scraper/cli"
require "test_scraper/article"
require "test_scraper/scraper"
require "test_scraper/version"

module TestScraper
  class Error < StandardError; end
  # Your code goes here...
end
