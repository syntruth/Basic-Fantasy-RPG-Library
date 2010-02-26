module BFRPG

  # The following is to do a simple mapping method 
  # to convert common abbreviations to standard 
  # names.
  # i.e.: "dex" will be mapped to "dexterity"
  # Keys can either be a single symbol, or an array
  # of symbols that will be mapped to a single return
  # value.
  STANDARD_NAME_MAPPINGS = {
    [:hp, :hitpoints]              => :hit_points,
    [:ac, :armorclass]             => :armor_class,
    [:xp, :exp, :experiencepoints] => :experience_points,
    :str                           => :strength,
    :dex                           => :dexterity,
    :int                           => :intelligence,
    :wis                           => :wisdom,
    :con                           => :constitution,
    :chr                           => :charisma,
    :pp                            => :platinum_pieces,
    :gp                            => :gold_pieces,
    :ep                            => :electrum_pieces,
    :sp                            => :silver_pieces,
    :cp                            => :copper_pieces,
  }

  def BFRPG.stringify_name(name)
    return name.to_s.gsub("_", " ").downcase()
  end

  def BFRPG.symbolize_name(name="")
    return name.downcase.gsub(/\s/, "_").to_sym()
  end

  def BFRPG.get_standard_name(abbr)
    abbr = symbolize_name(abbr) if abbr.class == String

    STANDARD_NAME_MAPPINGS.each do |key, value|
      if (key.class == Array and key.include?(abbr)) or key == abbr
        return value
      else
        return abbr
      end
    end
  end

end
