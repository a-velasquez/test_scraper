require "colorize"

class TestScraper::CLI

  def call
    greeting
    TestScraper::Scraper.new("https://techcrunch.com").scrape_tech_crunch
    recent_articles
    menu
  end

  def greeting
    puts "Loading ...............".green.bold.blink
    puts ""
    puts "Welcome to:".green.bold
    puts "--.--          |    ,---.                    |    ".green.bold
    puts "  |  ,---.,---.|---.|    ,---..   .,---.,---.|---.".green.bold
    puts "  |  |---'|    |   ||    |    |   ||   ||    |   |".green.bold
    puts "  `  `---'`---'`   '`---'`    `---'`   '`---'`   '".green.bold
    puts ""
  end

  def recent_articles
    puts "Here's a list of the most recent articles:".green.bold
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".blue.bold
    TestScraper::Article.all.each.with_index(1) do |story, index|
      puts "#{index}. #{story.title}".blue.bold
      puts "#{story.url}".blue.bold
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "enter the number of the article you'd like to preview, or type 'recent' to see the list again".blue.bold
      input = gets.strip.downcase

      if input.to_i > 0
        posting = TestScraper::Article.all[input.to_i-1]
        puts "Here ya go!".blue.bold
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".blue.bold
        puts "#{posting.title}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".blue.bold
        puts "the full article can be found at: #{posting.url}"
      elsif input == "recent"
        recent_articles
      else
        puts "Hmmm. I didn't quite get that. Type 'recent' to see the lastest articles or 'exit.' to leave the application.".blue
      end
    end
  end

end
