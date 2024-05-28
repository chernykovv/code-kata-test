require_relative 'internal/list_composer'
require_relative 'internal/formatter'
require_relative 'internal/data_receiver'

class TodoHandler
	def run(args)
		return "Enter IDs" if args.empty?
		list = compose_list(args)
		data = receive_data(list)
		format_output(data)
	rescue ArgumentError
		'Some IDs are incorrect'
	end

	private

	def compose_list(args)
		Internal::ListComposer.compose(args)
	end

	def receive_data(list)
		Internal::DataReceiver.receive(list)
	end

	def format_output(result)
		Internal::Formatter.format(result)
	end
end
