def usage
    puts("USAGE")
    puts("\t./203hotline [n k | d]")
    puts("DESCRIPTION")
    puts("\tn\tvalue for the computation of (n k)")
    puts("\tk\tvalue for the computation of (n k)")
    puts("\td\taverage duration of calls (in seconds)")
    exit(0)
end

def getCallDuration(arg)
    if not /^[1-9]\d*$/ =~ arg
        STDERR.print(arg, ": Invalid duration\n")
        exit(84)
    end
    return arg.to_i
end

def getNK(argv)
    if not /^[1-9]\d*$/ =~ argv[0]
        STDERR.print(argv[0], ": Invalid value\n")
        exit(84)
    elsif not /^[1-9]\d*$/ =~ argv[1]
        STDERR.print(argv[1], ": Invalid value\n")
        exit(84)
    end

    n = argv[0].to_i
    k = argv[1].to_i

    if k > n
        STDERR.puts("k superior to n")
        exit(84)
    end

    return n, k
end

module Parameters
    def Parameters.parseParameters(argv)
        if argv.length == 0 or argv.length > 2
            STDERR.puts("Invalid number of arguments")
            exit(84)
        elsif argv.length == 1
            if argv[0] == "-h" or argv[0] == "--help"
                usage()
            else
                return 0, 0, getCallDuration(argv[0])
            end
        else
            n, k = getNK(argv)
            return n, k, 0
        end
    end
end
