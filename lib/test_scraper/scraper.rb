require 'nokogiri'
require 'open-uri'

class TestScraper::Scraper
  attr_accessor :article_arr

  def self.scrape_tech_crunch
    url = "https://techcrunch.com"
    document = open(url)
    content = document.read
    parsed_content = Nokogiri::HTML(content)
    @article_arr = [] 

    parsed_content.css("h2.post-block__title").css("a").each do |element|
      title = element.children.text.strip
      url = element.attribute("href").value
    end
  end

end
