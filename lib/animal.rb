class Animal
  attr_reader :name, :id

  def initialize(name, id)
    @name = name
    @id = id
  end

  def eat
    "Feed"
  end

  def speak
    "Animal call"
  end

end
