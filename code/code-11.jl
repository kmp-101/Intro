function histogram(s)
    d = Dict()
    for c in s
        if c ∉ keys(d)
            d[c] = 1
        else
            d[c] += 1
        end
    end
    return d
end
#==============================================================================#
function histogram2(s)
    d = Dict()
    for c in s
        d[c] = get(d, c, 0) + 1
    end
    return d
end

h = histogram2("brontosaurus")
#==============================================================================#
function printhist(h)
    for c in keys(h)
        println(c, " ", h[c])
    end
end

printhist(h)
#==============================================================================#
function printhist2(h)
    for c in sort(collect(keys(h)))
        println(c, " ", h[c])
    end
end

printhist2(h)
#==============================================================================#
function reverselookup(d, v)
    for k in keys(d)
        if d[k] == v
            return k
        end
    end
    error("LookupError - value v is not in the dictionary d")
end

h = histogram2("parrot")
reverselookup(h, 2)
reverselookup(h, 3)

findall(x -> x == 2, h)
#==============================================================================#
function invertdict(d)
    inverse = Dict()
    for key in keys(d)
        val = d[key]
        if val ∉ keys(inverse)
            inverse[val] = [key]
        else
            push!(inverse[val], key)
        end
    end
    inverse
end

hist = histogram("parrot")
inverse = invertdict(hist)
#==============================================================================#
known = Dict(0 => 0, 1 => 1)

function fibonacci(n)
    if n in keys(known)
        return known[n]
    end
    res = fibonacci(n - 1) + fibonacci(n - 2)
    known[n] = res
    res
end

fibonacci(1000)
fibonacci(10000)  # is negative, what happend?
#==============================================================================#
known = Dict(0 => 0, 1 => 1);
println(known)

function example4()
    known[2] = 1
    println("\nrunning example4\n")
end

example4()

println(known)
#==============================================================================#
known2 = Dict(0 => 0, 1 => 1);
println(known2)

function example5()
    global known2 = Dict()
    println("\nrunning example5\n")
end

example5()

println(known2)
#==============================================================================#
const known3 = Dict(0 => 0, 1 => 1)
println(known3)

function example6()
    known3[2] = 1
end

example6()

println(known3)
#==============================================================================#
#Exercise 11-1
function createDict()
    fileIn = open(
        "E:\\Julia\\a-Pluto-NoteBooks\\ThinkJulia-notebooks\\words.txt")
    lexiconDict = Dict()
    M = 0
    for word in eachline(fileIn)
        len = length(word)
        lexiconDict[word] = len
        if M < len
            M = len
        end
    end
    close(fileIn)
    return M, lexiconDict
end


lexicon = createDict()

# From Exercise 10-12
function invertDict(d)
    inverse = Dict()
    for key in keys(d)
        val = d[key]
        if !(val in keys(inverse))
            inverse[val] = [key]
        else
            push!(inverse[val], key)
        end
    end
    inverse
end

function merged(word, candidate)
    wordarray = collect(word)
    candarray = collect(candidate)
    merger = ""
    for i = 1:length(wordarray)
        merger = merger * wordarray[i]
        merger = merger * candarray[i]
    end
    return merger
end

function interlock()

    M, wordDict = createDict()
    reverseDict = invertDict(wordDict)
    interlock_array = []
    k = 0

    for word in keys(wordDict)
        if length(word) > M ÷ 2
            continue
        else
            candidates = reverseDict[length(word)]
            if !(length(candidates) > 1)
                continue
            end
        end

        for candidate in candidates
            merger = merged(word, candidate)

            k += 1
            if k % 10000 == 0
                println(k)
            end
            length(merger)
            if merger in reverseDict[length(merger)]
                @show [word, candidate, merger]
                push!(interlock_array, [word, candidate, merger])
            else
                continue
            end
        end
    end
    return interlock_array
end

interlock()
