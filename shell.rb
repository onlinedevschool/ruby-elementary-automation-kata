require_relative 'round'

# method from https://www.learneroo.com/modules/147/nodes/804
def do_stuff(a, b)
  Round.new(a, b).output.map do |generation|
    generation
  end
end

# imperative shell
t = gets.to_i
for i in 1..t do
  a, b = gets.strip.split.map {|i| i.to_i}
  # imperative shell
  puts do_stuff(a, b).join("\n")
end
