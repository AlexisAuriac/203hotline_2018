MAX_CALLS = 3500
HOURS_PER_DAY = 8.0
SEC_PER_HOUR = 3600.0
MIN_N = 0
MAX_N = 50

module Distributions
    def Distributions.printProbs(probs)
        for i in MIN_N..MAX_N
            printf("#{i} -> %.3f", probs[i])
            if (i + 1) % 6 != 0 and i != 50
                print "\t"
            else
                puts
            end
        end
    end

    def Distributions.getOverload(probs)
        return probs.slice(26, 25).inject(:+) * 100.0
    end
end
