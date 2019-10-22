require 'nokogiri'
require 'open-uri'

class TestScraper::Scraper
  attr_accessor :parsed_content

  def initialize(url)
    url = "https://techcrunch.com"
    document = open(url)
    content = document.read
    @parsed_content = Nokogiri::HTML(content)

  end

  def self.scrape_tech_crunch
    articles = @parsed_content.css("h2.post-block__title").css("a")
    top_stories = articles.map do |story|
      stories = {
        :title => sotry.children.text.strip
        :url = story.attribute("href").value
      }
      TestScraper::Article.new(stories)
    end
    byebug
  end

end
