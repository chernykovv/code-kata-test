require 'rspec'
require './internal/data_receiver'

describe Internal::DataReceiver do
  describe "#recieve" do
    subject(:service_call) { described_class.receive(data) }

    let(:data) { [2, 4] }
    let(:gateway) { instance_double(Internal::Gateway, todos: [])}

    before do
      allow(Internal::Gateway).to receive(:new).and_return(gateway)
    end

    it "calls Internal::Gateway" do
      service_call
      expect(gateway).to have_received(:todos).twice
    end
  end
end
