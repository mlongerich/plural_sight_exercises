class Spaceship
  attr_accessor :destination 
  attr_reader :name, :call_sign
  attr_writer :name
  protected :call_sign

  @thruster_count = 2

  def initialize(name = "Anonymous", cargo_module_count = 10)
    @name = name
#    @cargo_hold = CargoHold.new(cargo_module_count)
    @power_level = 100
    @call_sign = "DeeNot"
  end

  def call_sign_matches?(other)
    call_sign == other.call_sign 
  end

  def call_sign_what
    call_sign
  end

  def launch(destination)
    @destination = destination
    begin
      batten_hatches
    rescue
      puts "Couldn't batten hatches"
      return false
    end
    light_seatbelt_sign
  end

  
  def cancel_launch
    destination = "local variable"
    self.destination = "uses accessor"
  end

  def capture(unit)
    unit.dock
#    transport_to_storage(unit)
  end

  def self.thruster_count
    @thruster_count
  end

  # private_class_method :thruster_count

  private 

  #def batten_hatches
  #  puts "Batten the hatches"
  #end

  def light_seatbelt_sign
    puts "The seatbelt sign is now on"
  end

end

class SpritelySpaceship < Spaceship
  @thruster_count = 4

  def initialize
    batten_hatches
    super
    @call_sign = "Fast cruiser"
  rescue StandardError => e
    puts "Exception intercepted"
    puts e.message
    puts "Backtrace"
    puts e.backtrace
    puts "Raise"
    puts $!.message
  end
end

class EconolineSpaceship < Spaceship
  @thruster_count = 1
end
class Probe
  def deploy(deploy_time, return_time)
    puts "Deploy the probe"
  end
  def take_sample
    puts "Take generic sample" 
  end
  def dock
    puts "Probe specific Docking"
    puts "Docking actions"
  end
end

class MineralProbe < Probe
  def take_sample
    puts "Take mineral sample"
  end

  def deploy(deploy_time)
    puts "Preparing sample chamber"
    super(deploy_time, Time.now + 2 * 60 * 60) # 2 hours from now
  end
end

class AtmosphericProbe < Probe
  def take_sample
    puts "Takes atmospheric sample"
  end
end

class Lander
  def dock
    puts "Lander specific docking actions"
  end
end

ship = Spaceship.new("Dreadnaught", 4)
ship.launch("Earth")

puts ship.inspect
p ship
puts ship.destination
puts ship.name
puts ship.cancel_launch

probe = MineralProbe.new
probe.deploy(Time.now)

ship.capture(probe)
puts Spaceship.thruster_count

puts SpritelySpaceship.thruster_count
puts EconolineSpaceship.thruster_count

begin
  ship.send :batten_hatches
rescue
  puts "Could not batten down hatches"
end
fast_ship = SpritelySpaceship.new

p ship
p fast_ship
puts fast_ship.call_sign_matches?(ship)
puts fast_ship.call_sign_what
