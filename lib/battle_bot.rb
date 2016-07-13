require 'weapon'

class BattleBot

  
  attr_reader :name, :health, :enemies, :weapon
  @@picked_up_weapons = []
  @@battlebots = 0

  def initialize(name)
    @name = name
    @health = 100
    @enemies = []
    @weapon = nil
    @@battlebots += 1
    
  end

  def dead?
    @health < 1
  end

  def has_weapon?
    !!@weapon
  end


  def pick_up(weapon)
    if weapon.class != Weapon 
      raise ArgumentError
    elsif @@picked_up_weapons.include?(weapon)
      raise ArgumentError
    elsif @weapon == nil
      @@picked_up_weapons << weapon
      @weapon = weapon
      @weapon.bot = self
      @weapon
    end

  end

  def drop_weapon
    @weapon.bot = nil
    @weapon = nil
  end

  def take_damage(damage)
    if damage.class != Fixnum
      raise ArgumentError
    elsif @health > damage
      @health -= damage
    else
      @health = 0
      @@battlebots -= 1
    end
    @health
  end

  def heal
    @health += 10 unless dead?
    @health > 100 ? @health = 100 : @health
  end

  def attack(enemy)
    if enemy.class != BattleBot
      raise ArgumentError
    elsif @weapon == nil
      raise ArgumentError
    elsif enemy == self
      raise ArgumentError
    else
      enemy.receive_attack_from(self)
    end


  end

  def receive_attack_from(enemy)
    if enemy.class != BattleBot
      raise ArgumentError
    elsif enemy.weapon == nil
      raise ArgumentError
    elsif !dead?
      take_damage(enemy.weapon.damage) 
      enemies << enemy unless enemies.include?(enemy)
      defend_against(enemy)
    end

  end

  def defend_against(enemy)
    if enemy.class != BattleBot
      raise ArgumentError
    end
    if !dead? && has_weapon?
      attack(enemy)
    end

  end

  def self.count
    @@battlebots
  end







end