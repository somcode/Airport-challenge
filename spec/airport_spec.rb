require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }
    describe "land" do
      it "instruct plane to land at airport" do
        expect(airport.land(plane)).to eq plane
    end
  end
end
