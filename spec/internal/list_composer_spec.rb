require 'rspec'
require './internal/list_composer'

describe Internal::ListComposer do
  describe '#compose' do
    subject(:service_call) { described_class.compose(data) }

    context "when data is valid" do
      let(:data) { [1, 2, 3] }

      it "returns correct array" do
        expect(service_call).to match([2])
      end
    end

    context "when data is not valid" do
      let(:data) { ['test'] }

      it "raises error" do
        expect { service_call }.to raise_error(ArgumentError)
      end
    end
  end
end
