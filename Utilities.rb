module Utilities
    def Utilities.factorial(n)
        if n == 0
            return 1
        end
        return n.downto(1).inject(:*)
    end

    def Utilities.combinations(n, k)
        return factorial(n) / (factorial(k) * factorial(n - k))
    end
end
