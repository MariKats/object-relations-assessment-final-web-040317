class Movie
  attr_accessor :title

  ALL = []

  def self.all
    ALL
  end

  def initialize(title)
    @title = title
    ALL << self
  end

  def self.find_by_title(title)
    Movie.all.find {|movie| movie.title = title}
  end

  def ratings
    Rating.all.find_all {|rating| rating.movie == self}
  end

  def viewers
    self.ratings.collect {|rating| rating.viewer}
  end

  def average_rating
    array = []
    self.ratings.collect {|rating| array << rating.score}
    array.inject{|sum, el| sum + el}.to_f / arr.length
  end
end
