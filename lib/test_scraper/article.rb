class TestScraper::Article
  attr_accessor :title, :url

  @@all = []

  def initialize(hash)
    hash.each do |k, v|
      self.send "#{k}=", v
    end
    @@all << self 
  end

  def self.all
    @@all
  end



end
