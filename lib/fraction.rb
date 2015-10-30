# encoding: utf-8

class Fraction

	attr_reader :p, :q
	
	def initialize(p, q)
        
		raise ArgumentError, "El numerador debe ser un número entero" unless p.is_a? Integer
		raise ArgumentError, "El denominador debe ser un número entero" unless q.is_a? Integer
		
		raise ArgumentError, "El denominador debe ser un número entero positivo" unless q > 0
		
		@p, @q = p, q
		
	end
	
	def to_s
		"#{p}/#{q}"
	end

end
