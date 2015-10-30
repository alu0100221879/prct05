# encoding: utf-8

class Fraction

	attr_reader :p, :q
	
	def initialize(p, q)
        
		raise ArgumentError, "El numerador debe ser un número entero" unless p.is_a? Integer
		raise ArgumentError, "El denominador debe ser un número entero" unless q.is_a? Integer
		
		raise ArgumentError, "El denominador debe ser un número entero positivo" unless q > 0
		
		r = Fraction.gcd(p.abs, q)
		@p, @q = p / r, q / r
		
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
	
	def *(n)
		raise ArgumentError, "Una fracción sólo se puede multiplicar por otra fracción" unless n.instance_of? Fraction
		return Fraction.new(@p * n.p, @q * n.q)
	end
	
	def /(n)
		raise ArgumentError, "Una fracción sólo se puede dividir por otra fracción" unless n.instance_of? Fraction
		raise ArgumentError, "No se puede dividir entre 0" if n.p == 0
		return Fraction.new(@p * n.q, @q * n.p)
	end
	
	def -@
		return Fraction.new(-@p, @q)
	end
	
	def +(n)
		
		raise ArgumentError, "Una fracción sólo se puede sumar a otra fracción" unless n.instance_of? Fraction
		
		denominator = Fraction.lcm(@q, n.q)
		numerator_s = @p * (denominator / @q)
		numerator_n = n.p * (denominator / n.q)
		
		return Fraction.new(numerator_s + numerator_n, denominator)
		
	end
	
	def -(n)
		raise ArgumentError, "Una fracción sólo se puede restar por otra fracción" unless n.instance_of? Fraction
		return self + (-n)
	end

end
