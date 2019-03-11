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

def getValue(arg)
    if not /^[1-9]\d*$/ =~ arg
        STDERR.print(arg, ": Invalid value\n")
        exit(84)
    end
    return arg.to_i
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
            return getValue(argv[0]), getValue(argv[1]), 0
        end
    end
end
