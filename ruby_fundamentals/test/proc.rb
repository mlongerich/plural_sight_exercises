def debug_only(params = nil, &block)
  puts "Params class: #{params.class}"
  puts "Block class: #{block.class}" if block_given?
end

debug_only { }
puts "---"
p = Proc.new {|bla| puts "I'm a proc that says #{bla}!"}

debug_only(p)
puts "---"
debug_only(&p)

p.call "yay!"
p.yield "wow!"
p.("nothing")
p["hello"]
