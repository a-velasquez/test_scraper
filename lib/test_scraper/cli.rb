require 'pry'
require 'nokogiri'
require 'colorize'

class CLI

  def run
    make_articles
    display_students
    binding.pry
    add_full_article_to_headlinee
  end

  def make_articles
    article_array = Scraper.scrape_headlines("https://techcrunch.com")
    Article.create_from_collection(article_array)
  end

  def add_full_article_to_headline
    Article.all.each do |article|
      attributes = Scraper.scrape_profile_page(article.href)
      article.add_student_attributes(attributes)
    end
  end

  def display_students
    Article.all.each do |article|
      puts "  #{article.title}\n".colorize(:blue)
      puts "  #{article.preview}\\n".colorize(:blue)
      puts "----------------------".colorize(:green)
    end
  end

end

# class TestScraper::CLI
#
#   def call
#     greeting
#     get_articles
#     recent_articles
#     menu
#   end
#
#   def greeting
#     puts " Loading ...............".blink.green
#     puts ""
#     puts " Welcome to".white.bold
#     puts " --.--          |    ,---.                    |    ".white.bold
#     puts "   |  ,---.,---.|---.|    ,---..   .,---.,---.|---.".white.bold
#     puts "   |  |---'|    |   ||    |    |   ||   ||    |   |".white.bold
#     puts "   `  `---'`---'`   '`---'`    `---'`   '`---'`   '".white.bold
#     puts ""
#   end
#
#   def get_articles
#     article_array = TestScraper::Scraper.scrape_tech_crunch("https://techcrunch.com")
#   end
#
#   def recent_articles
#     puts " Here's a list of the most recent articles from Tech Crunch:".white
#     puts "=".white * 115
#     TestScraper::Article.all.each.with_index(1) do |article, index|
#       puts " ⚪️ #{index}. #{article.title}".white
#       puts "=".white * 115
#     end
#   end
#
#   def menu
#     input = nil
#     while input != "exit"
#       puts " Enter the number of the article you'd like to preview".white
#       input = gets.strip
#
#       if input.to_i > 0
#         selected_article = TestScraper::Article.all[input.to_i-1]
#         puts ""
#         puts "Here ya go!".white
#         puts "=".white * 115
#         puts " ⚪️ #{selected_article.preview}".white
#         puts "=".white * 115
#         puts ""
#         puts "the full article can be found at:".white + " #{selected_article.href}".green.bold.underline
#         puts ""
#       elsif input == "recent"
#         recent_articles
#       elsif input == "exit"
#         goodbye
#       else
#         puts "Hmmm. I didn't quite get that. Type 'recent' to see the lastest articles or 'exit.' to leave the application.".white
#       end
#     end
#   end
#
#   def goodbye
#     puts " 👋🏼 Thanks For Stopping By!".white
#   end
#
# end

























# class TestScraper::CLI
#
#   def call
#     greeting
#     get_articles
#     recent_articles
#     menu
#   end
#
#   def greeting
#     puts " Loading ...............".blink.green
#     puts ""
#     puts " Welcome to".white.bold
#     puts " --.--          |    ,---.                    |    ".white.bold
#     puts "   |  ,---.,---.|---.|    ,---..   .,---.,---.|---.".white.bold
#     puts "   |  |---'|    |   ||    |    |   ||   ||    |   |".white.bold
#     puts "   `  `---'`---'`   '`---'`    `---'`   '`---'`   '".white.bold
#     puts ""
#   end
#
#   def get_articles
#     article_array = TestScraper::Scraper.scrape_tech_crunch("https://techcrunch.com")
#   end
#
#   def recent_articles
#     puts " Here's a list of the most recent articles from Tech Crunch:".white
#     puts "=".white * 115
#     TestScraper::Article.all.each.with_index(1) do |article, index|
#       puts " ⚪️ #{index}. #{article.title}".white
#       puts "=".white * 115
#     end
#   end
#
#   def menu
#     input = nil
#     while input != "exit"
#       puts " Enter the number of the article you'd like to preview".white
#       input = gets.strip
#
#       if input.to_i > 0
#         selected_article = TestScraper::Article.all[input.to_i-1]
#         puts ""
#         puts "Here ya go!".white
#         puts "=".white * 115
#         puts " ⚪️ #{selected_article.preview}".white
#         puts "=".white * 115
#         puts ""
#         puts "the full article can be found at:".white + " #{selected_article.href}".green.bold.underline
#         puts ""
#       elsif input == "recent"
#         recent_articles
#       elsif input == "exit"
#         goodbye
#       else
#         puts "Hmmm. I didn't quite get that. Type 'recent' to see the lastest articles or 'exit.' to leave the application.".white
#       end
#     end
#   end
#
#   def goodbye
#     puts " 👋🏼 Thanks For Stopping By!".white
#   end
#
# end
