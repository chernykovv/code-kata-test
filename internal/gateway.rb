require 'httparty'

module Internal
  class Gateway
    include HTTParty

    base_uri 'https://jsonplaceholder.typicode.com'
    headers "Content-Type" => "application/json; charset=UTF-8"

    raise_on [400, 401, 404, 405, 403, 422, 500, 501, 502, 503, 504]

    def todos(number)
      self.class.get("/todos/#{number}")
    end
  end
end
