class SlugError < StandardError
	attr_reader :objeto

	def initialize(objeto)
		@objeto = objeto
	end
end