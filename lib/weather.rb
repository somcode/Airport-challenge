class Weather

  def stormy?
    weather_generator == :stormy
  end

  def weather_generator
    [:sunny, :sunny, :sunny, :sunny, :stormy].sample
  end

  # def stormy?
  #   weather_generator == 0
  # end
  #
  # def wheather_generator
  #   rand(5)
  # end

end
