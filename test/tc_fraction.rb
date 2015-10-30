# encoding: utf-8

require 'lib/fraction.rb'
require 'test/unit'

class TestFraction < Test::Unit::TestCase

	def setup
		@medio = Fraction.new(1, 2)
		@cuarto = Fraction.new(1, 4)
	end
	
	def tear_down
		# Nada
	end
	
	def test_simple
		assert_equal("1/2", @medio.to_s)
	end
	
	def test_numerator_check
		assert_raise(ArgumentError) {Fraction.new('1', 2)}
	end
	
	def test_denominator_check
		assert_raise(ArgumentError) {Fraction.new(1, '2')}
		assert_raise(ArgumentError) {Fraction.new(1, 0)}
		assert_raise(ArgumentError) {Fraction.new(1, -5)}
	end	

end
