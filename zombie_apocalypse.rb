class Zombie

  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed, strength)
    if speed > @@max_speed
      @speed = @@default_speed
    else
      @speed = speed
    end
    if strength > @@max_strength
      @strength = @@default_strength
    else
      @strength = strength
    end
  end

  def encounter
    if outrun_zombie? == true
      "You escaped!"
    elsif survive_attack? == true
      "You escaped!"
    else
      speed = rand(@@max_speed)
      strength = rand(@@max_strength)
      @@horde << Zombie.new(speed, strength)
      "You are now a zombie"
    end
  end

  def outrun_zombie?
    your_speed = rand(@@max_speed)
    if your_speed > @speed
      true
    else
      false
    end
  end

  def survive_attack?
    your_strength = rand(@@max_strength)
    if your_strength > @strength
      true
    else
      false
    end
  end

  def self.all
    @@horde
  end

  def self.new_day
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_level
  end

  def self.some_die_off
    how_many_die = rand(11)
    p how_many_die
    how_many_die.times do
      @@horde.pop
    end
  end

  def self.spawn
    zombie_plague_level = rand(@@plague_level)
    speed = rand(@@max_speed)
    strength = rand(@@max_strength)
    zombie_plague_level.times do
      @@horde << Zombie.new(speed, strength)
    end
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end

end

p Zombie.all.inspect
p "*------*"
Zombie.spawn
p Zombie.all.inspect
p "*------*"
p Zombie.increase_plague_level
p "*------*"
Zombie.new_day
p Zombie.all.inspect
p "*------*"
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
p zombie1.encounter
p Zombie.all.inspect
