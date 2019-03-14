require_relative "Parameters.rb"
require "minitest/autorun"

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
