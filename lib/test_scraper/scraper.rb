require 'nokogiri'
require 'open-uri'
require 'pry'

class TestScraper::Scraper
  attr_accessor :doc, :articles, :title, :url

  def initialize(url)
    #url = "https://techcrunch.com"
    @doc = Nokogiri::HTML(open(url))
    #binding.pry
  end

  def scrape_tech_crunch
    articles = @doc.css("h2.post-block__title").css("a")
    top_stories = articles.each do |story|
      stories = {
        :title => story.children.text.stripq,
        :url => story.attribute("href").value
      }
      TestScraper::Article.new(stories)
    end
    binding.pry
  end

end
