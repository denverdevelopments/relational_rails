class Cow < Animal
  attr_reader :chew

  def initialize(chew, name, id)
    @chew = chew
    super(name, id)
  end

  def speak
    "Moo"
  end

end

Cow.new.eat
Cow.new.speak
