require_relative '../lib/game'

describe BowlingGame do
  let(:game) { BowlingGame.new }
  let(:peter_game) { [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] }
  let(:michael_game) { [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]}
  let(:susie_game) { [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6 , 4, 10, 2, 8, 6] }

  describe 'frames should be parsed to generate sums' do
    it "Peter should have 10 frames with two 0's each" do
      expect(game.rolls(peter_game).send(:generate_sums)).to eq([[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]])  
    end

    it "if there is a strike" do
      expect(game.rolls([10]).send(:generate_sums)).to eq([[10, 0, nil, nil]])
    end

    it "Susie should have 10 frames with mixed scores" do
      expect(game.rolls(susie_game).send(:generate_sums)).to eq([[1, 4], [4, 5], [6, 4, 5], [5, 5, 10], [10, 0, 0, 1], [0, 1], [7, 3, 6], [6 , 4, 10], [10, 0, 2, 8], [2, 8, 6]])
    end

    it "Michael should have 10 frames with an strike in frame 1-9 and 3 strikes in frame 10" do
      expect(game.rolls(michael_game).send(:generate_sums)).to eq([[10, 0, 10, 10], [10, 0, 10, 10], [10, 0, 10, 10], [10, 0, 10, 10], [10, 0, 10, 10], [10, 0, 10, 10], [10, 0, 10, 10], [10, 0, 10, 10], [10, 0, 10, 10], [10, 0, 10, 10]])
    end
  end
  describe 'final score' do
    it 'should be 0 for Peter' do
      expect(game.rolls(peter_game).score).to eq(0)
    end

    it 'should properly calculate a non-strike/non-spare frame' do
      expect(game.rolls([1,4]).score).to eq(5)
    end

    it 'should properly calculate a spare ' do
      expect(game.rolls([6,4,1,4]).score).to eq(16)
    end

    it 'should properly calculate a strike' do
      expect(game.rolls([10,4,1]).score).to eq(20)
    end
      
    it 'should be 133 for Susie' do
      expect(game.rolls(susie_game).score).to eq(133)
    end
    it 'should be 300 for Michael' do
      expect(game.rolls(michael_game).score).to eq(300)
    end
  end
end
