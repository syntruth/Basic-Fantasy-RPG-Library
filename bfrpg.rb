# Generic Basic Fantasy RPG ruby library.
# This is meant to be an abstraction for various uses.
# Author: Randy Carnahan
# Date: March 19, 2008
# Version: 1.0
# License: GPL

require "bfrpg_saving_throws"
require "bfrpg_name_mapping"

module BFRPG

  ABILITY_MODS = {
    3      => -3,
    4..5   => -2,
    6..8   => -1,
    9..12  => 0,
    13..15 => 1,
    16..17 => 2,
    18     => 3
  }

  def BFRPG.get_ability_mod(num)
    return 0 if num.nil?
    ABILITY_MODS.each do |k, v|
      if k.class == Range
        return v if k.include?(num)
      elsif k.class == Fixnum
        return v if k == num
      end
    end
  end

  class CharacterClass
    attr :name
    def initialize(type_id, name)
      @type = type_id
      @attack_type = type_id
      @save_type = type_id
      @name = name
    end

    def attack_as(type_id)
      @attack_type = type_id
    end

    def get_attack_bonus(level)
      return BFRPG.get_attack_bonus(@attack_type, level)
    end

    def save_as(type_id)
      @type = type_id
    end

    def get_saving_throw(save_against, level)
      return BFRPG.get_saving_throw(@save_type, save_against, level)
    end

  end

  CLASSES = {
    :fighter   => CharacterClass.new(:fighter, "fighter"),
    :cleric    => CharacterClass.new(:cleric, "cleric"),
    :magicuser => CharacterClass.new(:magicuser, "magic-user"),
    :thief     => CharacterClass.new(:thief, "thief")
  }

  class CharacterRace
    attr :name
    def initialize(type_id, name, allowed_classes)
      @type = type_id
      @name = name

      @allowed_classes = []

      if allowed_classes == :all
        @allowed_classes = CLASSES.keys()
      elsif allowed_classes.class == Array
        @allowed_classes = allowed_classes
      end

    end

    def classes
      return @allowed_classes
    end

    def class_allowed?(class_name)
      return @allowed_classes.include?(class_name)
    end

  end

  RACES = {
    :human => CharacterRace.new(:human, "human", :all),
    :elf => CharacterRace.new(:elf, "elf", :all), 
    :dwarf => CharacterRace.new(:dwarf, "dwarf", [:fighter, :cleric, :thief]), 
    :halfling => CharacterRace.new(:halfling, "halfling", [:fighter, :cleric, :thief]), 
    :gnome => CharacterRace.new(:gnome, "gnome", :all)
  }

  ATTACK_BONUS = {
    :fighter => {
      0      => 0, 
      1      => 1, 
      2..3   => 2,
      4      => 3,
      5..6   => 4,
      7      => 5,
      8..10  => 6,
      11..12 => 7,
      13..15 => 8,
      16..17 => 9,
      18..20 => 10
    },
	
    :cleric => {
      0      => 0,
      1..2   => 1,
      3..4   => 2,
      5..6   => 3,
      7..8   => 4,
      9..11  => 5,
      12..14 => 6,
      15..17 => 7,
      18..20 => 8
    },

    :thief => {
      0      => 0,
      1..2   => 1,
      3..4   => 2,
      5..6   => 3,
      7..8   => 4,
      9..11  => 5,
      12..14 => 6,
      15..17 => 7,
      18..20 => 8
    },
	
    :magicuser => {
      0      => 0,
      1..3   => 1,
      4..5   => 2,
      6..8   => 3,
      9..12  => 4,
      13..15 => 5,
      16..18 => 6,
      19..20 => 7
    }
  }


  def BFRPG.get_attack_bonus(type, level)
    ab = nil
    if ATTACK_BONUS.has_key?(type)
      ATTACK_BONUS[type].each do |k, v|
        if k.class == Range
          ab = v if k.include?(level)
        elsif k.class == Fixnum
          ab = v if k == level
        end
      end
    end
    return ab
  end


  def BFRPG.get_race(name)
    if RACES.has_key?(name)
      return RACES[name]
    else
      return nil
    end
  end

  def BFRPG.get_class(name)
    if CLASSES.has_key?(name)
      return CLASSES[name]
    else
      return nil
    end
  end

  class Character
    attr_accessor :name
    attr_accessor :level
    def initialize(name, race, class_type, level, attributes={})
      @name = name
      @race = RACES[race]
      @class = CLASSES[class_type]
      @level = level

      @attributes = {}

      STANDARD_NAME_MAPPINGS.values.each do |key|
        @attributes[key] = 0
      end

      if attributes.class == Hash
        attributes.each do |k, v|
          k = BFRPG.get_standard_name(k)
          @attributes[k] = v if not k.nil?
        end
      end

    end

    def get_attack_bonus(attack_type=:none)
      ab = @class.get_attack_bonus(@level)
      mod = 0
      case attack_type
      when :melee
        mod = BFRPG.get_ability_mod(self.strength())
      when :range
        mod = BFRPG.get_ability_mod(self.dexterity())
      end
      return ab + mod
    end

    def get_saving_throw(save_against)
      return @class.get_saving_throw(save_against, @level)
    end

    def method_missing(name, *args)
      name = name.id2name.downcase
      if name[0..3] == "set_"
        name = name[4..-1]
        name = BFRPG.get_standard_name(name)
        if args.any?
          @attributes[name] = args[0]
        end
        return name
      else
        name = BFRPG.get_standard_name(name)
        return @attributes[name] if @attributes.has_key?(name)
      end
    end

  end

  def BFRPG.create_character(name, race, class_type, level, attrs={})
    return Character.new(name, race, class_type, level, attrs)
  end

end


