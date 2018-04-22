require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane1) { double("plane1") }
  let(:plane2) { double("plane2") }


  describe "#land" do
    context "when the weather is sunny" do
      it "instruct plane to land at airport" do
        allow(airport.weather).to receive(:stormy?) { false }
        expect(airport.land(plane1)).to eq ([plane1])
      end
    end

    context "when the weather is stormy" do
      it "prevent landing" do
        allow(airport.weather).to receive(:stormy?) { true }
        expect{ airport.land(plane1) }.to raise_error "You can't land in stormy weather"
      end
    end
  end

  context "when airport is full" do
    it "prevent landing" do
      airport.capacity = 0
      allow(airport.weather).to receive(:stormy?) { false }
      expect { airport.land(plane1) }.to raise_error "Airport is full"
    end
  end


  describe "#take_off" do
    context "when there is one plane at hanger" do
      it "instruct the plane to take off" do
        airport.hangar = [plane1]
        allow(airport.weather).to receive(:stormy?) { false }
        expect(airport.take_off(plane1)).to eq ([])
      end
    end

    context "when there are more than one plane in hanger" do
      it "instruct one of the planes in hanger to take off and it confirms plane has taken off" do
        airport.hangar = [plane1, plane2]
        allow(airport.weather).to receive(:stormy?) { false }
        expect(airport.take_off(plane1)).to eq ([plane2])
      end
    end

    context "when the weather is stormy" do
      it "prevent the plane from take off" do
        airport.hangar = [plane1]
        allow(airport.weather).to receive(:stormy?) { true }
        expect{ airport.take_off(plane1) }.to raise_error "You can't take off in stormy weather"
      end
    end

  end

end
