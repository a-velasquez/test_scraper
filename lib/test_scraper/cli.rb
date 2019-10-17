require "colorize"

class TestScraper::CLI

  def call
    greeting
  end

  def greeting
    puts "Loading ...............".green.bold
    puts ""
    puts "Welcome to:".green.bold
    puts "--.--          |    ,---.                    |    ".green.bold
    puts "  |  ,---.,---.|---.|    ,---..   .,---.,---.|---.".green.bold
    puts "  |  |---'|    |   ||    |    |   ||   ||    |   |".green.bold
    puts "  `  `---'`---'`   '`---'`    `---'`   '`---'`   '".green.bold
    puts ""
  end

  def recent_articles
    puts "Here's a list of the most recent articles:"
    articles = TestScraper.scrape_tech_crunch
    articles.each.with_index(1) do |value, index|
      puts "#{index} - #{value.title}"
      puts "#{value.url}"
    end
  end



end
