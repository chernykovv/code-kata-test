module Internal
	MAX_ELEMENTS_COUNT = 20.freeze

	class ListComposer
		def self.compose(data)
			data.select { |elem| Integer(elem).even? }.take(MAX_ELEMENTS_COUNT)
		end
	end
end
