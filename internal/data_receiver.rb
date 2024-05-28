require_relative './gateway'

module Internal
  class DataReceiver
    class << self
      def receive(list)
        list.map do |element|
          gateway.todos(element)
        end
      end

      def gateway
        @gateway ||= Internal::Gateway.new
      end
    end
  end
end