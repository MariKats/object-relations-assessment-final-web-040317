class Viewer
  attr_accessor :first_name, :last_name

  ALL = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    ALL << self
  end

  def self.all
    ALL
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(name)
    self.all.find {|viewer| viewer.full_name == name}
  end

  def create_rating(score, movie)
    Rating.new(score, self, movie)
  end
end

# bob_smith = Viewer.new("bob", "smith")
# jane_smith = Viewer.new("jane", "smith")
# bob_smith.create_rating("4", Movie.new("speed"))

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

class Rating
  attr_accessor :score, :viewer, :movie

   ALL = []

   def self.all
     ALL
   end

   def initialize(score, viewer, movie)
     @score = score
     @viewer = viewer
     @movie = movie
     ALL << self
   end
end
