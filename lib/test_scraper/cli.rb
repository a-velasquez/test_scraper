class CLI

  def run
    make_articles
    add_full_article_to_headline
    binding.pry
    greeting
    display_articles
    menu
  end

  def greeting
    puts " Welcome to".green.bold
    puts ""
    puts " #######                       #####                                     ".green.bold
    puts "    #    ######  ####  #    # #     # #####  #    # #    #  ####  #    # ".green.bold
    puts "    #    #      #    # #    # #       #    # #    # ##   # #    # #    # ".green.bold
    puts "    #    #####  #      ###### #       #    # #    # # #  # #      ###### ".green.bold
    puts "    #    #      #      #    # #       #####  #    # #  # # #      #    # ".green.bold
    puts "    #    #      #    # #    # #     # #   #  #    # #   ## #    # #    # ".green.bold
    puts "    #    ######  ####  #    #  #####  #    #  ####  #    #  ####  #    # ".green.bold
    puts ""
    puts " Below is a list of the most recent articles from TechCrunch.com".green.bold
    puts ""
    puts "~".yellow.bold * 120
  end

  def make_articles
    article_array = Scraper.scrape_headlines("https://techcrunch.com")
    Article.create_from_collection(article_array)
  end

  def add_full_article_to_headline
    Article.all.each do |headline|
      attributes = Scraper.scrape_profile_page(headline.href)
      headline.add_student_attributes(attributes)
    end
  end

  def display_articles
    Article.all.each.with_index(1) do |article, index|
      puts ""
      puts " #{index}. #{article.title}".green.bold
      puts "     By #{article.author}".green.bold
      puts ""
      puts " ✳️ #{article.preview}".green
      puts "~".yellow.bold * 120
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts " Enter the number of the article you'd like to read:".green.bold
      puts ""
      input = gets.strip

      if input.to_i > 0 && input.to_i < 21
        selected_article = Article.all[input.to_i-1]
        puts ""
        puts "=".yellow.bold * 135
        puts " #{selected_article.title}".green.bold
        puts " By #{selected_article.author}".green.bold
        puts ""
        puts " ✳️ #{selected_article.text}".green
        puts ""
        puts "=".yellow.bold * 135
        puts ""
        puts "If you'd like to open the article in your browser, click here 👉🏼".green + " #{selected_article.href}".green.bold
        puts ""
        puts "=".yellow.bold * 135
      elsif input == "recent"
        display_articles
      elsif input == "exit"
        goodbye
      else
        puts "Hmmm. I didn't quite get that. Type 'recent' to see the lastest articles or 'exit.' to leave the application.".green.bold
      end
    end
  end

  def goodbye
    puts "  👋🏼 Thanks for stopping by!".green.bold
  end
end
