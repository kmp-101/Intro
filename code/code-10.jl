for cheese in cheeses
    println(cheese)
end
#=================================#
for i in eachindex(numbers)
    numbers[i] = numbers[i] * 2
end
#=================================#
t = ['a', 'b', 'c']
push!(t, 'd')
#=================================#
t1 = ['a', 'b', 'c']
t2 = ['d', 'e']
append!(t1, t2)
#=================================#
t3 = ['d', 'c', 'e', 'b', 'a']
sort!(t3)
#=================================#
function addall(t)
    total = 0
    for x in t
        total += x
    end
    total
end
#=================================#
function capitalizeall(t)
    res = []
    for s in t
        push!(res, uppercase(s))
    end
    return res
end

capitalizeall("banana")
#=================================#
function onlyupper(t)
    res = []
    for s in t
        if s == uppercase(s)
            push!(res, s)
        end
    end
    return res
end

onlyupper("bAnAnA")
#=================================#
t = uppercase.(["abc", "def", "ghi"])
print(t)
#=================================#
t = ['a', 'b', 'c']
splice!(t, 2)
print(t)
#=================================#
t = ['a', 'b', 'c']
pop!(t)
print(t)
#=================================#
t = ['a', 'b', 'c']
popfirst!(t)
print(t)
pushfirst!(t, 'd')
print(t)
push!(t, 'c')
print(t)
print(deleteat!(t, 2))
print(insert!(t, 2, 'x'))
#=================================#
t = collect("spam")
print(t)
t = split("pining for the fjords")
print(t)
t = split("spam-spam-spam", '-')
print(t)
#=================================#
t = ["pining", "for", "the", "fjords"]
s = join(t, ' ')
print(s)
#=================================#
a = [1, 2, 3]
b = a
b ≡ a

b[1] = 42
print(a)
#=================================#
t1 = [1, 2]
t2 = push!(t1, 3);
print(t1)

t3 = vcat(t1, [4]);
print(t1)
print(t3)
#=================================#
insert!(t, 4, x)
push!(t, x)
append!(t, [x])
#==============================================================================#
#Exercise 10-1
function nestedsum(array)
    sum = 0
    for element in array
        for number in element
            sum = sum + number
        end
    end
    return sum
end

nestedsum([4 5])
nestedsum([4 5; 6 7])
nestedsum([[1 2], [3], [4 5; 6 7]])
#==============================================================================#
#Exercise 10-2
function cumulsum(array)
    len = length(array)
    CS = zeros(len)
    sum = 0
    for k = 1:len
        sum = sum + array[k]
        CS[k] = sum
    end
    return CS
end

cumulsum([4 5])
cumulsum([4 5; 6 7])
#==============================================================================#
#Exercise 10-3
function interior(array)
    a = array[:]
    return a[2:end-1]
end

interior([4 5; 6 7])
interior([6 7])
interior([4 5 6 7])
#==============================================================================#
#Exercise 10-4
function interior!(b)
    global b = b[2:end-1]
    return nothing
end

b = [4 5 6 7]
interior!(b)
b
#==============================================================================#
#Exercise 10-5
function issort(array)
    a = sort(array, dims = 2)
    return a == array
end

issort([1 2 2])
issort([1 3 2])
issort(['b' 'a'])
issort(['a' 'b'])
#==============================================================================#
#Exercise 10-6
function isanagram(word1::String, word2::String)::Bool
    if sizeof(word1) != sizeof(word2)
        return false
    else
        set1 = join(sort(collect(word1)))
        set2 = join(sort(collect(word2)))
        return set1 == set2
    end
end

isanagram("apa", "pap")
#==============================================================================#
#Exercise 10-7
function hasduplicates(array)
    return sizeof(union(array)) == sizeof(array)
end

hasduplicates(['a' 'p' 'a'])
hasduplicates([1 2 1])
hasduplicates([1 2 3])
#==============================================================================#
#Exercise 10-8
function relfreq(n = 1000000)
    sum = 0
    for k = 1:n
        if hasduplicates(rand(1:364, 23))
            sum += 1
        end
    end
    return sum / n
end

relfreq()
relfreq(1000)
#==============================================================================#
#Exercise 10-9
function createArray()
    fileIn = open("E:\\Julia\\a-Pluto-NoteBooks\\ThinkJulia-notebooks\\words.txt")
    lexicon = []
    for word in eachline(fileIn)
        push!(lexicon, word)
    end
    close(fileIn)
    return lexicon
end

lexicon = createArray()

#==========================#
function createArray2()
    fileIn = open("E:\\Julia\\a-Pluto-NoteBooks\\ThinkJulia-notebooks\\words.txt")
    lexicon = []
    for word in eachline(fileIn)
        lexicon = [lexicon..., word]
    end
    close(fileIn)
    return lexicon

end

lexicon = createArray2()
#==============================================================================#
#Exercise 10-10
function inbisect(array, word, flag = false)
    len = length(array) ÷ 2
    if len < 1
        return flag = false
    elseif len == 1
        return flag = (word in array)
    elseif word > array[len]
        flag = inbisect(array[len+1:end], word, flag)
    else
        flag = inbisect(array[1:len], word, flag)
    end
    return flag
end

array = createArray()

inbisect(array, "aadvark")
#==============================================================================#
#Exercise 10-11
function reversepairs()
    array = createArray()
    pairarray = []
    for word in array
        reverseword = word[end:-1:1]
        if inbisect(array, reverseword)
            push!(pairarray, [word, reverseword])
        end
    end
    return pairarray
end

pairs = reversepairs()
#==============================================================================#
#Exercise 10-12
function filter_length(array, word)
    len = length(word)
    len_array = length.(array)
    return findall(x -> (x == len), len_array)
end

#==
function filter_characters(array, word)
    len = length(word)
    return findall(x -> (length(x) == len) && all(c -> c in x, word), array)
end
==#

function filter_characters(array, word)
    return findall(x -> all(c -> c in x, word), array)
end


function filter_word(array, word)
    return findall(w -> w != word, array)
end

function filter_merged(array, merger)
    return findall(x -> (x == merger), array)
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

    array = createArray()
    array = array[50000:51000]
    interlock_array = []
    k = 0

    for word in array
        c_ind = filter_length(array, word)
        if length(c_ind) > 1
            candidates = array[c_ind]
            w_ind = filter_word(candidates, word)
            candidates = candidates[w_ind]
        else
            continue
        end

        for candidate in candidates
            merger = merged(word, candidate)

            k += 1
            if k % 10000 == 0
                println(k)
            end

            m_ind = filter_length(array, merger)
            m_candidates = array[m_ind]

            m_ind = filter_characters(m_candidates, merger)
            m_candidates = m_candidates[m_ind]

            if length(filter_merged(m_candidates, merger)) > 0
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
