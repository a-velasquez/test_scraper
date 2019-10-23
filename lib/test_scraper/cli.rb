require "colorize"

class TestScraper::CLI

  def call
    greeting
    TestScraper::Scraper.new("https://techcrunch.com").scrape_tech_crunch
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
    TestScraper::Article.all.each.with_index(1) do |story, index|
      puts "#{index}. #{story.title}"
      puts "#{story.url}"
    end
  end

end
