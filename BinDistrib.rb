require "./Distributions.rb"

def binomialDistribution(n, k, p)
    return Utilities.combinations(n, k) * p**k * (1.0 - p)**(n - k)
end

def getBinProbs(d)
    p = d / SEC_PER_HOUR / HOURS_PER_DAY

    probs = []
    for i in MIN_N..MAX_N
        prob = binomialDistribution(MAX_CALLS, i, p)
        probs << prob
    end
    return probs
end

module BinDistrib
    def BinDistrib.testBinDistrib(d)
        start = Time.now
        puts "Binomial distribution:"

        probs = getBinProbs(d)
        Distributions.printProbs(probs)

        printf("overload:  %.1f%%\n", 0)

        printf("computation time:  %.2f ms\n", (Time.now - start) * 1000.0)
    end
end
