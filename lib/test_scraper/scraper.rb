require "pry"

class TestScraper::Scraper

  def self.scrape_tech_crunch(homepage)
    doc = Nokogiri::HTML(open(homepage))
    doc.css('.post-block').map do |story| # navigates down from the selected node

    title   = story.at_css('h2.post-block__title a')
    preview = story.at_css('div.post-block__content')

    TestScraper::Article.new(
      title:   title.content.strip,
      href:    title['href'],
      preview: preview.content.strip
      )
    end
  end


end
