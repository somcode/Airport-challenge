require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :weather
  attr_accessor :hangar, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = DEFAULT_CAPACITY
    @weather = Weather.new
  end

  def land(plane)
    raise ("You can't land in stormy weather") if @weather.stormy?
    raise ("Airport is full") if @hangar.length == capacity
    @hangar.push(plane)
  end

  def take_off(plane)
    raise ("You can't take off in stormy weather") if @weather.stormy?
    raise ("Plane is already taken off") if flying?(plane)
    @hangar.delete(plane)
    @hangar
  end

  private

  def flying?(plane)
    !@hangar.include?(plane)
  end

end
