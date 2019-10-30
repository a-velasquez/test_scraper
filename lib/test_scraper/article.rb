class TestScraper::Article
  attr_accessor :title, :href, :preview, :full_text

  @@all = []

  def initialize(article_hash)
    article_hash.each do |k, v|
      self.send "#{k}=", v
    end
    @@all << self
  end

  def self.add_full_text(full_text_hash) #use to add full text to hash of article objects
    full_text_hash.each do |k, v|
      self.send "#{k}=", v
    end
  end

  def self.all
    @@all
  end
end
