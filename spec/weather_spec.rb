require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  describe "#weather_generator" do
    it "check the weather" do
      srand(0)
      expect(subject.weather_generator).to eq :stormy
    end
  end

end
