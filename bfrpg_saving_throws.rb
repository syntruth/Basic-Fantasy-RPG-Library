module BFRPG

  SAVING_THROWS = {
    :fighter => {
      :death_ray_or_poison => {
        1      => 12,
        2..3   => 11,
        4..5   => 11,
        6..7   => 10,
        8..9   =>  9,
        10..11 =>  9,
        12..13 =>  8,
        14..15 =>  7,
        16..17 =>  7,
        18..19 =>  6,
        20     =>  5
      },

      :magic_wands => {
        1      => 13,
        2..3   => 12,
        4..5   => 11,
        6..7   => 11,
        8..9   => 10,
        10..11 =>  9,
        12..13 =>  9,
        14..15 =>  8,
        16..17 =>  7,
        18..19 =>  7,
        20     =>  6
      },

      :paralysis_or_petrify => {
        1      => 14,
        2..3   => 14,
        4..5   => 13,
        6..7   => 12,
        8..9   => 12,
        10..11 => 11,
        12..13 => 10,
        14..15 => 10,
        16..17 =>  9,
        18..19 =>  8,
        20     =>  8
      },

      :dragon_breath => {
        1      => 15,
        2..3   => 15,
        4..5   => 14,
        6..7   => 14,
        8..9   => 13,
        10..11 => 12,
        12..13 => 12,
        14..15 => 11,
        16..17 => 10,
        18..19 => 10,
        20     =>  9
      },

      :spells => {
        1      => 17,
        2..3   => 16,
        4..5   => 15,
        6..7   => 15,
        8..9   => 14,
        10..11 => 13,
        12..13 => 13,
        14..15 => 12,
        16..17 => 11,
        18..19 => 11,
        20     => 10
      },
    },

    :cleric => {
      :death_ray_or_poison => {
        1      => 11,
        2..3   => 10,
        4..5   =>  9,
        6..7   =>  9,
        8..9   =>  8,
        10..11 =>  8,
        12..13 =>  7,
        14..15 =>  7,
        16..17 =>  6,
        18..19 =>  6,
        20     =>  5
      },

      :magic_wands => {
        1      => 12,
        2..3   => 11,
        4..5   => 10,
        6..7   => 10,
        8..9   =>  9,
        10..11 =>  9,
        12..13 =>  8,
        14..15 =>  8,
        16..17 =>  7,
        18..19 =>  7,
        20     =>  6
      },

      :paralysis_or_petrify => {
        1      => 14,
        2..3   => 13,
        4..5   => 13,
        6..7   => 12,
        8..9   => 12,
        10..11 => 11,
        12..13 => 11,
        14..15 => 10,
        16..17 => 10,
        18..19 =>  9,
        20     =>  9
      },

      :dragon_breath => {
        1      => 16,
        2..3   => 15,
        4..5   => 15,
        6..7   => 14,
        8..9   => 14,
        10..11 => 13,
        12..13 => 13,
        14..15 => 12,
        16..17 => 12,
        18..19 => 11,
        20     => 11
      },

      :spells => {
        1      => 15,
        2..3   => 14,
        4..5   => 14,
        6..7   => 13,
        8..9   => 13,
        10..11 => 12,
        12..13 => 12,
        14..15 => 11,
        16..17 => 11,
        18..19 => 10,
        20     => 10
      },
    },

    :magicuser => {
      :death_ray_or_poison => {
        1      => 13,
        2..3   => 13,
        4..5   => 12,
        6..7   => 12,
        8..9   => 11,
        10..11 => 11,
        12..13 => 10,
        14..15 => 10,
        16..17 =>  9,
        18..19 =>  9,
        20     =>  8
      },

      :magic_wands => {
        1      => 14,
        2..3   => 14,
        4..5   => 13,
        6..7   => 12,
        8..9   => 11,
        10..11 => 10,
        12..13 => 10,
        14..15 =>  9,
        16..17 =>  8,
        18..19 =>  7,
        20     =>  6
      },

      :paralysis_or_petrify => {
        1      => 13,
        2..3   => 13,
        4..5   => 12,
        6..7   => 11,
        8..9   => 10,
        10..11 =>  9,
        12..13 =>  9,
        14..15 =>  8,
        16..17 =>  7,
        18..19 =>  6,
        20     =>  5
      },

      :dragon_breath => {
        1      => 16,
        2..3   => 15,
        4..5   => 15,
        6..7   => 14,
        8..9   => 14,
        10..11 => 13,
        12..13 => 13,
        14..15 => 12,
        16..17 => 12,
        18..19 => 11,
        20     => 11
      },

      :spells => {
        1      => 15,
        2..3   => 14,
        4..5   => 13,
        6..7   => 13,
        8..9   => 12,
        10..11 => 11,
        12..13 => 11,
        14..15 => 10,
        16..17 =>  9,
        18..19 =>  9,
        20     =>  8
      },
    },

    :thief => {
      :death_ray_or_poison => {
        1      => 13,
        2..3   => 12,
        4..5   => 11,
        6..7   => 11,
        8..9   => 10,
        10..11 =>  9,
        12..13 =>  9,
        14..15 =>  8,
        16..17 =>  7,
        18..19 =>  7,
        20     =>  6
      },

      :magic_wands => {
        1      => 14,
        2..3   => 14,
        4..5   => 13,
        6..7   => 13,
        8..9   => 12,
        10..11 => 12,
        12..13 => 10,
        14..15 => 10,
        16..17 =>  9,
        18..19 =>  9,
        20     =>  8
      },

      :paralysis_or_petrify => {
        1      => 13,
        2..3   => 12,
        4..5   => 12,
        6..7   => 11,
        8..9   => 11,
        10..11 => 10,
        12..13 => 10,
        14..15 =>  9,
        16..17 =>  9,
        18..19 =>  8,
        20     =>  8
      },

      :dragon_breath => {
        1      => 16,
        2..3   => 15,
        4..5   => 14,
        6..7   => 13,
        8..9   => 12,
        10..11 => 11,
        12..13 => 10,
        14..15 =>  9,
        16..17 =>  8,
        18..19 =>  7,
        20     =>  6
      },

      :spells => {
        1      => 15,
        2..3   => 14,
        4..5   => 13,
        6..7   => 13,
        8..9   => 12,
        10..11 => 11,
        12..13 => 11,
        14..15 => 10,
        16..17 =>  9,
        18..19 =>  9,
        20     =>  8
      },
    },


  }

  def BFRPG.get_saving_throw(class_type, saving_throw, level)
    st = nil
    if SAVING_THROWS.has_key?(class_type)
      if SAVING_THROWS[class_type].has_key?(saving_throw)
        SAVING_THROWS[class_type][saving_throw].each do |k, v|
          if k.class == Range
            st = v if k.include?(level)
          elsif k.class == Fixnum
            st = v if k == level
          end
        end
      end      
    end
    return st
  end

end
