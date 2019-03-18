#!/bin/ruby

require "./Utilities.rb"
require "./Parameters.rb"
require "./BinDistrib.rb"
require "./PoissonDistrib.rb"

def main(argv)
    n, k, d = Parameters.parseParameters(argv)

    if d != 0
        BinDistrib.testBinDistrib(d)
        puts
        PoissonDistrib.testPoissonDistrib(d)
    else
        puts("#{k}-combination of a #{n} set:")
        puts(Utilities.binCoef(n, k))
    end
    exit(0)
end

if __FILE__ == $0
    main(ARGV)
end
