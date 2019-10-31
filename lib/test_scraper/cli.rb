require 'pry'
require 'nokogiri'
require 'colorize'

class CLI
  BASE_PATH = "https://learn-co-curriculum.github.io/student-scraper-test-page/"

  def run
    make_students
    add_attributes_to_students
    display_students
  end

  def make_students
    students_array = Scraper.scrape_index_page(BASE_PATH + 'index.html')
    Article.create_from_collection(students_array)
  end

  def add_attributes_to_students
    Article.all.each do |student|
      attributes = Scraper.scrape_profile_page(BASE_PATH + student.profile_url)
      student.add_student_attributes(attributes)
    end
  end

  def display_students
    Article.all.each do |student|
      puts "#{student.name.upcase}".colorize(:blue)
      puts "  location:".colorize(:light_blue) + " #{student.location}"
      puts "  profile quote:".colorize(:light_blue) + " #{student.profile_quote}"
      puts "  bio:".colorize(:light_blue) + " #{student.bio}"
      puts "  twitter:".colorize(:light_blue) + " #{student.twitter}"
      puts "  linkedin:".colorize(:light_blue) + " #{student.linkedin}"
      puts "  github:".colorize(:light_blue) + " #{student.github}"
      puts "  blog:".colorize(:light_blue) + " #{student.blog}"
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
