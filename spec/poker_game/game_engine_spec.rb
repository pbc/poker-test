require "spec_helper"

describe PokerGame::GameEngine do
  let(:engine) { described_class.new }

  context "#sort_hands_by_rank" do

    context "all hands of the 'high card' rank type" do
      let(:provided_poker_hands) {
        engine.create_poker_hands [
          %w{2C 3C 4C 5C AC},
          %w{2C 3C 4C 5C QC},
          %w{2C 3C 4C 5C 8C},
          %w{2C 3C 4C 5C 9C}
        ]
      }

      let(:sorted_poker_hands_data) {
        [
          %w{2C 3C 4C 5C 8C},
          %w{2C 3C 4C 5C 9C},
          %w{2C 3C 4C 5C QC},
          %w{2C 3C 4C 5C AC}
        ]
      }

      it "sorts provided poker hands correctly" do
        expect(
          engine.sort_hands_by_rank(provided_poker_hands).map(&:cards)
        ).to eq sorted_poker_hands_data
      end
    end

  end
end