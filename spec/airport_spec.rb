require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane1) { double("plane1") }
  let(:plane2) { double("plane2") }


  describe "#land" do
    context "when the weather is sunny" do
      it "instruct plane to land at airport" do
        expect(airport.land(plane1, :sunny)).to eq ([plane1])
      end
    end

    context "when the weather is stormy" do
      it "prevent landing" do
        expect{ airport.land(plane1, :stormy) }.to raise_error "You can't land in stormy weather"
      end
    end

    context "when the plane is already landed" do
      it "can't land again" do
        airport.land(plane1, :sunny)
        expect{ airport.land(plane1, :sunny) }.to raise_error "Plane is already landed"
      end
    end
  end

  context "when airport is full" do
    it "prevent landing" do
      airport.capacity = 0
      expect { airport.land(plane1, :sunny) }.to raise_error "Airport is full"
    end
  end


  describe "#take_off" do
    context "when there is one plane at hanger" do
      it "instruct the plane to take off" do
        airport.hangar = [plane1]
        expect(airport.take_off(plane1, :sunny)).to eq ([])
      end
    end

    context "when there are more than one plane in hanger" do
      it "instruct one of the planes in hanger to take off and it confirms plane has taken off" do
        airport.hangar = [plane1, plane2]
        expect(airport.take_off(plane1, :sunny)).to eq ([plane2])
      end
    end

    context "when the weather is stormy" do
      it "prevent the plane from take off" do
        airport.hangar = [plane1]
        expect{ airport.take_off(plane1, :stormy) }.to raise_error "You can't take off in stormy weather"
      end
    end

    context "when the plane is already taken off" do
      it "can't take off anymore" do
        airport.hangar = [plane1]
        airport.take_off(plane1, :sunny)
        expect{ airport.take_off(plane1, :sunny) }.to raise_error "Plane is already taken off"
      end
    end

  end

end
