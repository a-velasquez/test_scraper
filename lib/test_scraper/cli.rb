require "colorize"

class TestScraper::CLI

  def call
    greeting
    recent_articles
  end

  def greeting
    puts "Loading ...............".green.bold
    puts ""
    puts "Welcome to:".white.bold
    puts "--.--          |    ,---.                    |    ".white.bold
    puts "  |  ,---.,---.|---.|    ,---..   .,---.,---.|---.".white.bold
    puts "  |  |---'|    |   ||    |    |   ||   ||    |   |".white.bold
    puts "  `  `---'`---'`   '`---'`    `---'`   '`---'`   '".white.bold
    puts ""
  end

  def recent_articles
    puts "Here's a list of the most recent articles:".white.bold
    # articles = TestScraper.scrape_tech_crunch
    # articles.each.with_index(1) do |value, index|
    puts "Article Title".white.bold
    puts "Article URL".white.bold
  end

end
