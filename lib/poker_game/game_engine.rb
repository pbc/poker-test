module PokerGame
  class GameEngine
    def sort_hands_by_rank(poker_hands)
      poker_hands.sort do |hand_x,hand_y|
        if rank_type(hand_x) == rank_type(hand_y)          
          highest_card_value(hand_x) <=> highest_card_value(hand_y)
        else

        end
      end
    end

    private

    def rank_type(poker_hand)
      "high_card"
    end

    def highest_card(poker_hand)
      sort_by_highest_card(poker_hand).last
    end


    def highest_card_value(poker_hand)
      card = highest_card(poker_hand)
      card_value(card)      
    end

    def sort_by_highest_card(poker_hand)
      poker_hand.sort do |x,y|
        card_value(x) <=> card_value(y)
      end
    end

    def card_value(card)
      ordered_available_card_values.index(card[0..-2])
    end

    def ordered_available_rank_types
      [ 
        "high_card", "pair", "two_pairs", "three_of_a_kind", "straight",
        "flush", "full_house", "four_of_a_kind", "straight_flush" 
      ]
    end

    def ordered_available_card_values
      %w{ 2 3 4 5 6 7 8 9 T J Q K A }
    end

  end
end