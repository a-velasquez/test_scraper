require "colorize"

class TestScraper::CLI

  def call
    greeting
    TestScraper::Scraper.new("https://techcrunch.com").scrape_tech_crunch
    recent_articles
    menu
  end

  def greeting
    puts "Loading ...............".blue.bold
    puts ""
    puts "Welcome to:".blue.bold
    puts "--.--          |    ,---.                    |    ".blue.bold
    puts "  |  ,---.,---.|---.|    ,---..   .,---.,---.|---.".blue.bold
    puts "  |  |---'|    |   ||    |    |   ||   ||    |   |".blue.bold
    puts "  `  `---'`---'`   '`---'`    `---'`   '`---'`   '".blue.bold
    puts ""
  end

  def recent_articles
    puts "Here's a list of the most recent articles:".blue.bold
    puts "=".blue.bold * 100
    TestScraper::Article.all.each.with_index(1) do |article, index|
      puts ">> #{index}. #{article.title}".blue.bold
      puts "=".blue.bold * 100
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the article you'd like to preview, or type 'recent' to see the list again".blue.bold
      input = gets.strip

      if input.to_i > 0
        posting = TestScraper::Article.all[input.to_i-1]
        puts "Here ya go!".blue.bold
        puts "=".blue.bold * 100
        puts ">> #{posting.preview}"
        puts "=".blue.bold * 100
        puts "the full article can be found at: #{posting.href}".blue.bold
      elsif input == "recent"
        recent_articles
      elsif input == "exit"
        goodbye
      else
        puts "Hmmm. I didn't quite get that. Type 'recent' to see the lastest articles or 'exit.' to leave the application.".blue
      end
    end
  end

  def goodbye
    puts "Thanks For Stopping By!".blue.bold
  end

end
