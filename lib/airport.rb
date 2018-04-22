require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :weather
  attr_accessor :hangar

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    raise ("You can't land in stormy weather") if @weather.stormy?
    @hangar.push(plane)
  end

  def take_off(plane)
    raise ("You can't take off in stormy weather") if @weather.stormy?
    @hangar.delete(plane)
    @hangar
  end

end
