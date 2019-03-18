require "stringio"
require "minitest/autorun"
require_relative "../203hotline.rb"

EXIT_SUCCESS = 0

RES1 = "./tests/res_ex1.txt"
RES2 = "./tests/res_ex2.txt"

class TestSubjectExample < Minitest::Test
    def test_binCoef
        output = StringIO.new()
        $stdout = output
        begin
            main(["100", "18"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_SUCCESS, e.status)
        end
        $stdout = STDOUT
        expected = File.read(RES1)
        assert_equal(expected, output.string)
    end

    def test_distrib
        output = StringIO.new()
        $stdout = output
        begin
            main(["180"])
            raise
        rescue SystemExit => e
            assert_equal(EXIT_SUCCESS, e.status)
        end
        $stdout = STDOUT
        expected = File.read(RES2)

        output = output.string.split("\n")
        expected = expected.split("\n")

        assert_equal(expected.length, output.length)
        for i in 0..expected.length
            if /^computation/ =~ expected[i]
                next
            end
            assert_equal(expected[i], output[i], "diff at line #{i}")
        end
    end
end
