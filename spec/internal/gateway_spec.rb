require 'rspec'
require './internal/gateway'

describe Internal::Gateway do
  describe "#todos" do
    subject(:make_request) { described_class.new.todos(id)}

    let(:id) { 1 }
    before do
      stub_request(:get, "https://jsonplaceholder.typicode.com/todos/#{id}").to_return(
        body: response_body.to_json,
        status: status,
        headers: { "Content-Type" => "application/json; charset=UTF-8" }
      )
    end

    context "when status is success" do
      let(:status) { 200 }
      let(:response_body) do
        [
          {
            "userId" => 1,
            "id" => 1,
            "title" => "delectus aut autem",
            "completed" => false
          }
        ]
      end

      it "doesn't raise an error" do
        expect { make_request }.not_to raise_error
      end
    end

    context "when occurs error" do
      let(:status) { [400, 401, 404, 405, 403, 422, 500, 501, 502, 503, 504].sample }
      let(:response_body) { { "error" => "something happened" }.to_json }

      it "raises error" do
        expect { make_request }.to raise_error(HTTParty::ResponseError)
      end
    end
  end
end
