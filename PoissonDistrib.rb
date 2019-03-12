require "./Distributions.rb"

def poissonDistribution(lambda, k)
    return (Math.exp(-lambda) * lambda ** k) / Utilities.factorial(k)
end

def getPoissonProbs(d)
    l = d * MAX_CALLS / SEC_PER_HOUR / HOURS_PER_DAY
    
    probs = []
    for i in MIN_N..MAX_N
        prob = poissonDistribution(l, i)
        probs << prob
    end
    return probs
end

module PoissonDistrib
    def PoissonDistrib.testPoissonDistrib(d)
        puts "Poisson distribution:"

        probs = getPoissonProbs(d)
        Distributions.printProbs(probs)

        printf("overload:  %.1f%%\n", 0)
        printf("computation time:  %.2f ms\n", 0)
    end
end
