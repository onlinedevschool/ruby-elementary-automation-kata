require_relative 'round'

def run_simulation(a, b)
  Round.new(a, b).output.map do |generation|
    generation
  end
end

# imperative shell
t = gets.to_i
for i in 1..t do
  a, b = gets.strip.split.map {|i| i.to_i}
  # imperative shell
  puts run_simulation(a, b).join("\n")
end
