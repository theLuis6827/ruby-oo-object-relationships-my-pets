class Owner

  attr_reader :name, :species

  @@all=[]
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count 
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do | cat_owners |
      cat_owners.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def feed_cats
    Cat.all.select do | feed_mood |
      feed_mood.mood = "happy"
    end
  end

  def dogs
    Dog.all.select do | dog_owners |
      dog_owners.owner == self
    end
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select do | walk_mood |
      walk_mood.mood = "happy"
    end
  end

  def sell_pets
    Dog.all.select do | sold |
      sold.mood = "nervous"
      sold.owner = nil
    end
    Cat.all.select do | sold |
      sold.mood = "nervous"
      sold.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end