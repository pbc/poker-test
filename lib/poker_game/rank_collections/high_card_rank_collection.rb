module PokerGame
  module RankCollections
    class HighCardRankCollection
      include PokerGame::RankCollections::RankCollection

      def initialize(poker_hands)
        @poker_hands = poker_hands
      end

      def sort!
        @poker_hands = @poker_hands.sort! do |hand_x,hand_y|
          hand_x.highest_card_value <=> hand_y.highest_card_value
        end
      end
    end
  end
end
