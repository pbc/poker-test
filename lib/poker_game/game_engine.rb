module PokerGame
  class GameEngine
    def sort_hands_by_rank(poker_hands)
      collections = collection_factory.split_into_collections(poker_hands)
      collections.each do |collection|
        collection.sort!
      end
      collections.sort do |collection_x,collection_y|
        collection_x <=> collection_y
      end

      collections.map do |collection|
        collection.poker_hands
      end.flatten
    end

    def collection_factory
      PokerGame::RankedCollectionFactory.new
    end

    def create_poker_hands(poker_hands_data)
      poker_hands_data.map do |cards|
        PokerGame::PokerHand.new(cards)
      end
    end
  end
end