class TestScraper::CLI

  def call
    greeting
    TestScraper::Scraper.scrape_tech_crunch("https://techcrunch.com")
    recent_articles
    binding.pry 
    menu
  end

  def greeting
    puts " Loading ...............".blink.green
    puts ""
    puts " Welcome to".white.bold
    puts " --.--          |    ,---.                    |    ".white.bold
    puts "   |  ,---.,---.|---.|    ,---..   .,---.,---.|---.".white.bold
    puts "   |  |---'|    |   ||    |    |   ||   ||    |   |".white.bold
    puts "   `  `---'`---'`   '`---'`    `---'`   '`---'`   '".white.bold
    puts ""
  end

  def recent_articles
    puts " Here's a list of the most recent articles from Tech Crunch:".white
    puts "=".white * 115
    TestScraper::Article.all.each.with_index(1) do |article, index|
      puts " ⚪️ #{index}. #{article.title}".white
      puts "=".white * 115
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts " Enter the number of the article you'd like to preview".white
      input = gets.strip

      if input.to_i > 0
        selected_article = TestScraper::Article.all[input.to_i-1]
        puts ""
        puts "Here ya go!".white
        puts "=".white * 115
        puts " ⚪️ #{selected_article.preview}".white
        puts "=".white * 115
        puts ""
        puts "the full article can be found at:".white + " #{selected_article.href}".green.bold.underline
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
    puts " 👋🏼 Thanks For Stopping By!".white
  end

end
