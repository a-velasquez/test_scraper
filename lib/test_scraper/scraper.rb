class TestScraper::Scraper
  attr_accessor :article_arr

  def self.scrape_tech_crunch
    url = "https://techcrunch.com"
    document = open(url)
    content = document.read
    parsed_content = Nokogiri::HTML(content)

    parsed_content.css("h2.post-block__title").css("a").each.with_index(1) do |a, i|
      title = a.children.text.strip
      url = a.attribute("href").value
    end
  end

end
