require_relative 'round'

def run_simulation(a, b)
  # use round.rb to create some code here to satisfy the challenge
  # requirements as listed in the readme.md
end

# imperative shell
t = gets.to_i
for i in 1..t do
  a, b = gets.strip.split.map {|i| i.to_i}
  # imperative shell
  puts run_simulation(a, b).join("\n")
end
