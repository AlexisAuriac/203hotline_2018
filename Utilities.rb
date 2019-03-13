module Utilities
    def Utilities.factorial(n)
        if n == 0
            return 1
        end
        return n.downto(1).inject(:*)
    end

    def Utilities.binCoef(n, k)
        if (k > n - k)
            k = n - k
        end

        res = 1

        for i in 0..(k - 1)
            res *= n - i
            res /= i + 1
        end
        return res
    end
end
