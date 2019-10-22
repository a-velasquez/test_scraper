require 'nokogiri'
require 'open-uri'
require 'pry'

class TestScraper::Scraper
  attr_accessor :doc

  def initialize(url)
    #url = "https://techcrunch.com"
    @doc = Nokogiri::HTML(open(url))
    #binding.pry
  end

  def scrape_tech_crunch
    @articles = []

    doc.css("h2.post-block__title").css("a").each do |a|
      title = a.children.text.strip
      url = a.attribute("href").value
      @articles << {title: title, url: url}
    end
    @articles
    binding.pry
  end

end
