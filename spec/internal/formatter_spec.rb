require 'rspec'
require './internal/formatter'

describe Internal::Formatter do
  describe "#format" do
    subject(:service_call) { described_class.format(data) }
    let(:data) do
      [
        {
          "title" => 'test title',
          "completed" => true
        },
        {
          "title" => 'test title 2',
          "completed" => false
        }
      ]
    end

    it "returns correct string" do
      compared_string = "test title: completed\ntest title 2: not completed"
      expect(service_call).to eq(compared_string)
    end
  end
end
