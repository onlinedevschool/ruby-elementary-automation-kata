class Round
  LIVE_CELL = 1
  DEAD_CELL = 0

  def initialize(seed, size)
    @seed, @size = seed, size.to_i
  end

  def output
    # this is called to return the output of the round
  end

private

  # implement your logic as private methods here

end
