module PokerGame
  class PokerHand

    attr_accessor :cards

    def initialize(cards)
      @cards = cards
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

    def rank_type_value
      type = rank_type
      ordered_available_rank_types.index(type)
    end

    def rank_type
      "high_card"
    end

    def highest_card
      sort_by_highest_card.last
    end


    def highest_card_value
      card_value(highest_card)
    end

    def sort_by_highest_card
      @cards = cards.sort do |x,y|
        card_value(x) <=> card_value(y)
      end
    end

    def card_value(card)
      ordered_available_card_values.index(card[0..-2])
    end

  end
end