class Round
  LIVE_CELL = 1
  DEAD_CELL = 0

  def initialize(seed, size)
    @seed, @size = seed, size.to_i
  end

  def output
    size.times.map { be_fruitful.join }
  end

private

  attr_reader :seed, :input, :size, :generation

  def genesis
    size.times.map { 0 } + seed.to_s.chars.map {|c| c.to_i }
  end

  def be_fruitful
    @generation = if singularity?
      genesis
    else
      multiply
    end
  end

  def multiply
    generation.map.with_index do |cell, i|
      left = generation[i-1].to_i
      right = generation[i+1].to_i
      next_generation(left, cell, right)
    end
  end

  def singularity?
    @generation.to_s.length == 0
  end

  def rules
    [
      { pattern: [1,1,1], result: 0 },
      { pattern: [1,1,0], result: 1 },
      { pattern: [1,0,1], result: 1 },
      { pattern: [1,0,0], result: 0 },
      { pattern: [0,1,1], result: 1 },
      { pattern: [0,1,0], result: 1 },
      { pattern: [0,0,1], result: 1 },
      { pattern: [0,0,0], result: 0 },
    ]
  end

  def next_generation(a, b, c)
    rules.select do |rule|
      rule[:pattern] == [a, b, c]
    end[0][:result]
  end
end
