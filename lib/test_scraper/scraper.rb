require 'nokogiri'
require 'open-uri'
require 'pry'

class TestScraper::Scraper
  attr_accessor :doc, :articles, :title, :href, :preview

  def initialize(url)
    url = "https://techcrunch.com"
    @doc = Nokogiri::HTML(open(url))
  end

#working - now just have to find a  way to call the information to CLI

  def scrape_tech_crunch
    @doc.css('.post-block').map do |story| # navigate down from the selected node

    title   = story.at_css('h2.post-block__title a')
    preview = story.at_css('div.post-block__content')

    TestScraper::Article.new(
      title:   title.content.strip,
      href:    title['href'],
      preview: preview.content.strip
      )
    end
    binding.pry
  end


end

# def scrape_tech_crunch
#   articles = @doc.css("h2.post-block__title").css("a")
#   top_stories = articles.each do |story|
#     stories = {
#       :title => story.children.text.strip,
#       :url => story.attribute("href").value,
#       :preview => @doc.css("div.post-block__content").children.first.text #only brings up the first article's preview
#     }
#     TestScraper::Article.new(stories)
#   end
# end

# :preview css selector for iterator => a = doc.css("div.post-block__content").children.text

# def list_articles
#   TestScraper::Article.all.each.with_index(1) do |story, index|
#     puts "#{index}. #{story.title}"
#     puts "#{story.url}"
#   end
# end
