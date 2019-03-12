module Utilities
    def Utilities.factorial(n)
        return n.downto(1).inject(:*)
    end

    def Utilities.combinations(n, k)
        return factorial(n) / (factorial(k) * factorial(n - k))
    end
end
