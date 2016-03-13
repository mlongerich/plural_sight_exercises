lander_count = 10

message = if lander_count > 10
  "Launching probe"
else
  "Waiting for probes to return"
end

puts message

a = b = 10
