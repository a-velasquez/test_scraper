class TestScraper::Article
  attr_accessor :title, :href, :preview

  @@all = []

  def initialize(hash)
    hash.each do |k, v|
      self.send "#{k}=", v
    end
    @@all << self
  end

  def add_student_attributes(attributes_hash) #use to add full text to hash of article objects
  attributes_hash.each do |key, value|
    self.send("#{key}=", value)
    end
  end

  def self.all
    @@all
  end
end
