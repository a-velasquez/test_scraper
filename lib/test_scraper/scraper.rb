require 'nokogiri'
require 'open-uri'
require 'pry'

class TestScraper::Scraper
  attr_accessor :doc

  def initialize(url)
    #url = "https://techcrunch.com"
    @doc = Nokogiri::HTML(open(url))
    binding.pry
  end

  def scrape_tech_crunch
    articles = @doc.css("h2.post-block__title").css("a")
    top_stories = articles.map do |story|
      stories = {
        :title => story.children.text.strip,
        :url => story.attribute("href").value.text
      }
        # TestScraper::Article.new(stories)
    
    end
  end


end
