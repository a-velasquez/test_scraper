class TestScraper::Article
  attr_accessor :title, :href, :preview, :text

  @@all = []

  def initialize(article_hash)
    article_hash.each do |k, v|
      self.send "#{k}=", v
    end
    @@all << self
  end

  def self.add_student_attributes(attributes_hash) #use to add full text to hash of article objects
    attributes_hash.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def self.all
    @@all
  end

end
