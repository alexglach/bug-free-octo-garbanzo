require 'battle_bot'

class Weapon

  attr_reader :name, :damage, :bot

  attr_writer :bot

  def initialize(name, damage=nil)
    if name.class != String
      raise ArgumentError
    else
      @name = name
    end
    if damage != nil
      if damage.class != Fixnum
        raise ArgumentError
      else
        @damage = damage
      end
    end
    @bot = nil
  end

  def bot=(new_bot=nil)
    if new_bot.class != BattleBot && new_bot != nil
      raise ArgumentError
    else
      @bot = new_bot
    end
  end

  def picked_up?
    bot.pick_up(weapon)
  end


end