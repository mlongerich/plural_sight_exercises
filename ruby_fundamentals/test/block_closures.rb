
class Spaceship
  def initialize(name)
    @name = name
    @debug = true
    @debug_attrs = {containment_status: :ok, core_temp: 350}
  end
    
  def debug_only
    return nil unless (@debug && block_given?)
    puts "Running debug code..."
    yeild @debug_attrs
  end

  def launch
    debug_only {p @debug_attrs}
  end
end

ship = Spaceship.new("Dreadnought")
#ship.launch

ship.debug_only do |attrs|
  return if ship.name != "Serenity"
  p attrs
end

