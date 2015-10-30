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
		return "#{p}/#{q}"
	end
	
	def self.gcd(n1, n2)
		
		raise ArgumentError, "Los números deben ser enteros" unless (n1.is_a? Integer) && (n2.is_a? Integer)
		
		p, q = n1, n2
		
		while q != 0
			r = p % q
			p = q
			q = r
		end
		
		return p
		
	end
	
	def self.lcm(n1, n2)		
		raise ArgumentError, "Los números deben ser enteros" unless (n1.is_a? Integer) && (n2.is_a? Integer)
		return (n1 * n2) / Fraction.gcd(n1, n2)
	end

end
