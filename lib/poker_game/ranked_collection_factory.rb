module PokerGame
  class RankedCollectionFactory

    def split_into_collections(poker_hands)
      poker_hands.group_by(&:rank_type).map do |type,hands|
        create_collection(type,hands)
      end
    end

    def create_collection(rank_type, poker_hands)
      case rank_type
      when "high_card"
        PokerGame::RankCollections::HighCardRankCollection.new(poker_hands)
      when "pair"
        PokerGame::RankCollections::PairRankCollection.new(poker_hands)
      end
    end


  end
end
