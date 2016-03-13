def can_launch?
  false
end

if can_launch?
  puts "can launch"
else
  puts "can't launch"
end


lander_cnt = 11

puts message = if lander_cnt > 10 then "Launching" else "Waiting" end


def launch
  puts "launch"
end

launch if can_launch?


fuel_level = 25

def set_fuel_light(color)
  puts color
end

if fuel_level > 50
  set_fuel_light("green")
elsif fuel_level > 25
  set_fuel_light("yellow")
else
  set_fuel_light("red")
end


unless fuel_level < 25
  launch
end

launch unless fuel_level < 25

def wait
  puts "wait"
end

can_launch? ? launch : wait


class Lander

  attr_accessor :lander_id

  def self.locate(lander_id)
    lander_id.to_s
  end

  def recall
    puts "recalled " + self
  end

  def maintain_thrust
    puts "Maintaining thrust"
  end

  def kill_thrust
    puts "Killing thrust"
  end

  def reverse_thrust
    puts "reversing thrust"
  end

  def park
    puts "parking"
  end
end

class String
  def recall
    puts "Recalled #{self}"
  end 
end

lander_id = 1

lander = Lander.locate(lander_id)
lander.recall if lander

lander = Lander.locate(lander_id) and lander.recall


class Engine

  def cut_out?
    true
  end
  def restart
    puts "restarted"
    true
  end
end

  def enable_emergency_power
    puts "enabled"
    false
  end

engine = Engine.new

if engine.cut_out?
  result = (engine.restart or enable_emergency_power)
  puts result
end

if engine.cut_out?
  enable_emergency_power unless engine.restart
end


lander = Lander.new

distance_to_dock = "collision imminent"

case distance_to_dock
when "far away"
  lander.maintain_thrust
when "coasting time"
  lander.kill_thrust
when "collision imminent"
  lander.reverse_thrust
end

thrust_power = case distance_to_dock
  when "far away" then  100
  when "coasting time" then 0
  when "collision imminent" then -100
  end

puts thrust_power

distance_to_dock = 2 

case
when distance_to_dock > 200 
  lander.maintain_thrust
when distance_to_dock > 2
  lander.kill_thrust
else
  lander.reverse_thrust
end

class Probe
  def initialize

  end

  def retrieve_sample
    puts "Retreiving sample"
  end

  def transport_to_storage
    puts "Transporting to storage"
  end
end

probe = Probe.new
p probe

unit = "ufo" 

def activate_alarm(messege)
  puts messege 
end

case unit
when Lander
  lander.park
when Probe
  probe.retrieve_sample
  probe.transport_to_storage
else
  activate_alarm("Unidentified unit")
end


[1,2,3].each do
  puts "This is Serenity, please respond"
end

ships = ["Dreadnaught", "SpeedyShip", "Serenity"]

ships.each {|ship| puts "Please respond #{ship}" }

3.times { puts "This is Serenity, please respond" }
