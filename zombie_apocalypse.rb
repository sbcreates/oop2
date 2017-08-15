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

  end

  def outrun_zombie?
    rand(@@max_speed)
  end

  def survive_attack?
  end

  def self.all
    total_horde = 0
    @horde.each do |zombies|
      total_horde += zombies
    end
    total_horde
  end

  def self.new_day
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_level
  end

  def self.some_die_off
    how_many_die = rand(11)
    how_many_die.times do
      @horde.pop
    end
  end

  def self.spawn
    zombie_plague_level = rand(@plague_level)
    @@horde << zombie_plague_level
    @speed = rand(@@max_speed)
    @strength = rand(@@max_strength)
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end

end

sam = Zombie.new(4, 7)

p sam.inspect

Zombie.increase_plague_level
