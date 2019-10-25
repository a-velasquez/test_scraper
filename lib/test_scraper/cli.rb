class TestScraper::CLI

  def call
    greeting
    TestScraper::Scraper.new("https://techcrunch.com").scrape_tech_crunch
    recent_articles
    menu
  end

  def greeting
    puts "Loading ...............".green
    puts ""
    puts "Welcome to"
    puts "--.--          |    ,---.                    |    ".white
    puts "  |  ,---.,---.|---.|    ,---..   .,---.,---.|---.".white
    puts "  |  |---'|    |   ||    |    |   ||   ||    |   |".white
    puts "  `  `---'`---'`   '`---'`    `---'`   '`---'`   '".white
    puts ""
  end

  def recent_articles
    puts "Here's a list of the most recent articles from Tech Crunch:".white
    puts "=".white * 130
    TestScraper::Article.all.each.with_index(1) do |article, index|
      puts " ⚪️ #{index}. #{article.title}".white
      puts "=".white * 130
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the article you'd like to preview".white
      input = gets.strip

      if input.to_i > 0
        selected_article = TestScraper::Article.all[input.to_i-1]
        puts ""
        puts "Here ya go!".white
        puts ""
        puts "=".white * 130
        puts "⚪️ #{selected_article.preview}".white
        puts "=".white * 130
        puts ""
        puts "the full article can be found at: #{posting.href}".white
        puts ""
      elsif input == "recent"
        recent_articles
      elsif input == "exit"
        goodbye
      else
        puts "Hmmm. I didn't quite get that. Type 'recent' to see the lastest articles or 'exit.' to leave the application.".white
      end
    end
  end

  def goodbye
    puts "👋🏼 Thanks For Stopping By!".white
  end

end
