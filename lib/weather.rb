class Weather

  def stormy?
    weather_generator == :stormy
  end

 private
  def weather_generator
    [:sunny, :sunny, :sunny, :sunny, :stormy].sample
  end

end
