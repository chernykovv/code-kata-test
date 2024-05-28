require 'httparty'

module Internal
  class Gateway
    include HTTParty

    base_uri 'https://jsonplaceholder.typicode.com'
    headers "Content-Type" => "application/json; charset=UTF-8"

    def todos(number)
      self.class.get("/todos/#{number}")
    end
  end
end
