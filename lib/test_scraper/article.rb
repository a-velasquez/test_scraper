class TestScraper::Article
  attr_accessor :title, :href, :preview 

  @@all = []

  def initialize(hash)
    hash.each do |k, v|
      self.send "#{k}=", v
    end
    @@all << self
  end


# TestScraper::Article.all returns @title and @url for each object.
  def self.all
    @@all
  end



end
