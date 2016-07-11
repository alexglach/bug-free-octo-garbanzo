require 'weapon'

class BattleBot

  
  attr_reader :name, :health, :enemies, :weapon

  def initialize(name)
    @name = name
    @health = 100
    @enemies = []
    @weapon = nil
  end

  def dead?
    false
  end

  def has_weapon?
    false
  end


  def pick_up(weapon)
    if weapon.class != Weapon
      raise ArgumentError
    elsif @weapon == nil
      @weapon = weapon
      @weapon.bot = self
      @weapon
    end

  end

  def drop_weapon
    @weapon = nil
    @weapon.bot = nil
  end

  def take_damage(damage)
    if damage.class != Fixnum
      raise ArgumentError
    elsif @health > 10
      @health -= 10
    else
      @health = 0
    end
    @health
  end

  def heal
    @health += 10
  end

  def attack(enemy)
    if enemy.class != BattleBot
      raise ArgumentError
    elsif @weapon == nil
      raise ArgumentError
    end


  end

  def receive_attack_from(enemy)
    if enemy.class != BattleBot
      raise ArgumentError
    elsif enemy.weapon == nil
      raise ArgumentError
    else
      take_damage(enemy.weapon.damage)
      enemies << enemy unless enemies.include?(enemy)
    end

  end

  def defend_against(enemy)
    if enemy.class != BattleBot
      raise ArgumentError
    end
  end








end