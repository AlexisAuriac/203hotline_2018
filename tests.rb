#!/bin/ruby

require "minitest/autorun"
require_relative "Parameters.rb"
require_relative "Utilities.rb"

EXIT_FAILURE = 84
EXIT_SUCCESS = 0

# Suppresses output on stdout and stderr
def puts(*args) end
def STDERR.puts(*args) end
def STDERR.print(*args) end

class TestArgv < Minitest::Test
    def test_nbArgv
        begin
            Parameters.parseParameters([])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_FAILURE, e.status)
        end

        begin
            Parameters.parseParameters(["1", "2", "3"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_FAILURE, e.status)
        end
    end

    def test_nk
        begin
            Parameters.parseParameters(["ab", "10"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_FAILURE, e.status)
        end

        begin
            Parameters.parseParameters(["10", "cd"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_FAILURE, e.status)
        end

        begin
            Parameters.parseParameters(["10", "11"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_FAILURE, e.status)
        end

        begin
            Parameters.parseParameters(["100", "-18"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_FAILURE, e.status)
        end

        begin
            Parameters.parseParameters(["100", "0"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_FAILURE, e.status)
        end

        begin
            Parameters.parseParameters(["0", "0"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_FAILURE, e.status)
        end

        Parameters.parseParameters(["100", "18"])
    end

    def test_callDuration
        begin
            Parameters.parseParameters([""])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_FAILURE, e.status)
        end

        begin
            Parameters.parseParameters(["ab"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_FAILURE, e.status)
        end

        begin
            Parameters.parseParameters(["0"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_FAILURE, e.status)
        end

        begin
            Parameters.parseParameters(["-5"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_FAILURE, e.status)
        end

        Parameters.parseParameters(["180"])
    end

    def test_help
        begin
            Parameters.parseParameters(["-h"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_SUCCESS, e.status)
        end
        
        begin
            Parameters.parseParameters(["--help"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_SUCCESS, e.status)
        end
    end
end

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
