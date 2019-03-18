require "minitest/autorun"
require_relative "../Utilities.rb"

class TestUtilities < Minitest::Test
    def test_factorial
        assert_equal(1, Utilities.factorial(0))
        assert_equal(1, Utilities.factorial(1))
        assert_equal(120, Utilities.factorial(5))
        assert_equal(12146304367025329675766243241881295855454217088483382315328918161829235892362167668831156960612640202170735835221294047782591091570411651472186029519906261646730733907419814952960000000000000000000000000000, Utilities.factorial(123))
    end

    def test_binCoef
        assert_equal(3, Utilities.binCoef(3, 2))
        assert_equal(30664510802988208300, Utilities.binCoef(100, 18))
        assert_equal(1, Utilities.binCoef(50, 50))
    end
end
