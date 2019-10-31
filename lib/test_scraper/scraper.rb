require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_headlines(index_url)
    articles = []
    html = open(index_url)
    headlines = Nokogiri::HTML(html)
    headlines.css('.post-block').each do |headline|
      headline_details = {}
      headline_details[:title]   = headline.at_css('h2.post-block__title a').text.strip
      headline_details[:preview] = headline.at_css('div.post-block__content').text.strip
      headline_details[:author]  = headline.at_css('div.river-byline').css('.river-byline__authors').text.strip
      headline_details[:href]    = headline.at_css('h2.post-block__title a').attribute('href').value

      articles << headline_details
    end
    articles
  end

 def self.scrape_profile_page(profile_url)
    full_articles = {}
    html = open(profile_url)
    full_text = Nokogiri::HTML(html)
    full_text.css('div.article-content').each do |article|
      full_articles[:text] = full_text.css('p').text
    end
    full_articles
  end

end
