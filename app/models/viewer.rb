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
