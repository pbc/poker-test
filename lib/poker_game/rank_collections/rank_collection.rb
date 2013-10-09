module PokerGame
  module RankCollections
    module RankCollection
      def self.included(target)
        target.send(:attr_accessor, :poker_hands)
      end

      # this will allow us to compare collections using "<=>"
      def to_i
        rank_type_value(poker_hands.first)
      end
     
      def group_hands_by_rank_type(poker_hands)
        sort_hands_by_rank_type(poker_hands).group_by do |hand| 
          rank_type(hand)
        end
      end

      def sort_hands_by_rank_type(poker_hands)
        poker_hands.sort do |hand_x,hand_y|
          rank_type_value(hand_x) <=> rank_type_value(hand_y)
        end
      end

      
    end
  end
end
