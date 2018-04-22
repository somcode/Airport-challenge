require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :weather

  def initialize
    @hanger = []
    @weather = Weather.new
  end

  def land(plane)
    @hanger.push(plane)
  end

  def take_off(plane)
    raise ("you can't take off in stormy weather") if @weather.stormy?
    @hanger.delete(plane)
    @hanger
  end

end
