module Internal
  class Formatter
    class << self
      def format(data)
        data.map{ compose_string(_1) }.join("\n")
      end

      private

      def compose_string(element)
        "#{element["title"]}: #{status_for(element)}"
      end

      def status_for(element)
        if element['completed']
          'completed'
        else
          'not completed'
        end
      end
    end
  end
end