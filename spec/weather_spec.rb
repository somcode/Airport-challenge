require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  describe "#stormy" do
    it "check the weather if is stormy" do
      allow(weather).to receive(:weather_generator) { :stormy }
      expect(weather.stormy?).to eq (true)
    end

    it "check the weather if it is not stormy" do
      allow(weather).to receive(:weather_generator) { :sunny }
      expect(weather.stormy?).to eq (false)
    end
  end
end
