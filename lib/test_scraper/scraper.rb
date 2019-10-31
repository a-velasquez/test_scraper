require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    articles = []
    html = open(index_url)
    headlines = Nokogiri::HTML(html)
    headlines.css("div.student-card").each do |student|
      student_details = {}
      student_details[:name] = student.css("h4.student-name").text
      student_details[:location] = student.css("p.student-location").text
      profile_path = student.css("a").attribute("href").value
      student_details[:profile_url] = student.css('a').attribute('href').value
      students << student_details
    end
    students
  end

 def self.scrape_profile_page(profile_url)
    student_profile = {}
    html = open(profile_url)
    profile = Nokogiri::HTML(html)

    # Social Links

    profile.css("div.main-wrapper.profile .social-icon-container a").each do |social|
      if social.attribute("href").value.include?("twitter")
        student_profile[:twitter] = social.attribute("href").value
      elsif social.attribute("href").value.include?("linkedin")
        student_profile[:linkedin] = social.attribute("href").value
      elsif social.attribute("href").value.include?("github")
        student_profile[:github] = social.attribute("href").value
      else
        student_profile[:blog] = social.attribute("href").value
      end
    end

    student_profile[:profile_quote] = profile.css("div.main-wrapper.profile .vitals-text-container .profile-quote").text
    student_profile[:bio] = profile.css("div.main-wrapper.profile .description-holder p").text

    student_profile
  end
end


# class TestScraper::Scraper
#
#   def self.scrape_tech_crunch(homepage)
#     doc = Nokogiri::HTML(open(homepage))
#     doc.css('.post-block').map do |story| # navigates down from the selected node
#
#     title   = story.at_css('h2.post-block__title a')
#     preview = story.at_css('div.post-block__content')
#
#     TestScraper::Article.new(
#       title:   title.content.strip,
#       href:    title['href'],
#       preview: preview.content.strip
#       )
#     end
#   end
#
#   def self.scrape_full_text(article_url)
#     full_articles = {}
#     doc = Nokogiri::HTML(open(article_url))
#     full_text = doc.css('div.article-content')
#     full_text.map do |article|
#       full_articles[:full_text]
#     end
#   end
#
# end
