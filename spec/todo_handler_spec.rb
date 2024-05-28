require 'rspec'
require './todo_handler'

describe TodoHandler do
  describe '#run' do
    subject(:run_handler) { described_class.new.run(args) }

    context "when args are valid" do

      let(:args) { [1, 2, 3] }
      let(:response) do
        [
          {
            "userId" => 1,
            "id" => 1,
            "title" => "delectus aut autem",
            "completed" => false
          }
        ]
      end

      before do
        allow(Internal::ListComposer).to receive(:compose).and_return([2])
        allow(Internal::DataReceiver).to receive(:receive).and_return(:response)
        allow(Internal::Formatter).to receive(:format).and_return("formatted string")
      end

      it "calls Internal::ListComposer service" do
        run_handler
        expect(Internal::ListComposer).to have_received(:compose)
      end

      it "calls Internal::DataReceiver service" do
        run_handler
        expect(Internal::DataReceiver).to have_received(:receive)
      end

      it "calls Internal::Formatter service" do
        run_handler
        expect(Internal::Formatter).to have_received(:format)
      end
    end

    context "when args are incorrect" do
      context "when args are empty" do
        let(:args) { [] }

        it "returns the proper text" do
          expect(run_handler).to eq("Enter IDs")
        end
      end

      context "when args include non-number character" do
        let(:args) { [1, 'test'] }

        it "returns the proper text" do
          expect(run_handler).to eq("Some IDs are incorrect")
        end
      end
    end
  end
end
