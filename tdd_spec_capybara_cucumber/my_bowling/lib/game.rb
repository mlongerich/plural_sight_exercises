class BowlingGame

  attr_reader :player_rolls
  
  def rolls(player_rolls)
    @player_rolls = player_rolls 
    self
  end

  def score
    generate_sums.flatten.reduce(:+)
  end

  private 

  def generate_sums
    @player_frames = []
    while player_rolls.length > 0 do
      if strike? 
        values_to_sum_for_strike 
      elsif spare? 
        values_to_sum_for_spare
      else
        values_to_sum 
      end
    end
    while @player_frames.length > 10 do
      @player_frames.pop
    end
    @player_frames
  end

  def strike?
    player_rolls[0] == 10
  end

  def values_to_sum_for_strike
    @player_frames << [player_rolls.shift, 0, player_rolls[0], player_rolls[1]]
  end

  def spare?
    player_rolls[0] + (player_rolls[1] || 0) == 10 
  end

  def values_to_sum_for_spare
    @player_frames << [player_rolls.shift, player_rolls.shift, player_rolls[0]]
  end

  def values_to_sum
    @player_frames << player_rolls.shift(2)
  end

end
