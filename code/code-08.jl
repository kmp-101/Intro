fruits = "🍌 🍎 🍐"

index = firstindex(fruits)
while index <= sizeof(fruits)
    letter = fruits[index]
    println(letter)
    global index = nextind(fruits, index)
end
#==============================================================================#
function stringTraversal(str)
    index = firstindex(str)
    while index <= sizeof(str)
        letter = str[index]
        println(letter)
        index = nextind(str, index)
    end

end

stringTraversal("banana")
#==============================================================================#
function strTraversal(str)
    for letter in str
        println(letter)
    end
end

strTraversal(fruits)
#==============================================================================#
function find(word, letter)
    index = firstindex(word)

    while index <= sizeof(word)
        if word[index] == letter
            return index
        end
        index = nextind(word, index)
    end
    -1
end

find("abracadabra", 's')
#==============================================================================#
function count(word, character)
	counter = 0
	for letter in word
	    if letter == character
	        counter = counter + 1
	    end
	end
	return counter
end

count("abracadabra banana apa", 'a')
#==============================================================================#
firstind = findfirst('a', "abracadabra banana apa")

fin = findfirst("a", "abracadabra banana apa")

typeof(fin)

findnext("ana", "banana", 3)
#==============================================================================#
'a' ∈ "banana"

'c' in "banana"
#==============================================================================#
function inboth(word1, word2)
    for letter in word1
        if letter ∈ word2
            print(letter, " ")
        end
    end
end

inboth("apples", "oranges")
#==============================================================================#
function word_comparison(word)
	if word < "banana"
		println("Your word, $word, comes before banana.")
	elseif word > "banana"
		println("Your word, $word, comes after banana.")
	else
		println("All right, bananas.")
	end
end

word_comparison("bananA")
#==============================================================================#
function isreverse(word1, word2)
    if length(word1) != length(word2)
        return false
    end

    i = firstindex(word1)
    j = lastindex(word2)
    while j > 0
        if word1[i] != word2[j]
            return false
        end
        i = nextind(word1, i)
        j = prevind(word2, j)
    end
    true
end

isreverse("banana", "ananab")
#==============================================================================#
#Exercise 8-9
function ispalindrome(str)
	return str[end:-1:1] == str
end

ispalindrome("")
#==============================================================================#
#Exercise 8-10
function anylowercase1(s)
    for c in s
        if islowercase(c)
            return true
        else
            return false
        end
    end
end

anylowercase1("APa")

#==============================#
function anylowercase2(s)
    for c in s
        if islowercase('c')
            return "true"
        else
            return "false"
        end
    end
end

anylowercase2("APa")

#==============================#
function anylowercase3(s, flag=false)
    for c in s
        flag = islowercase(c)
    end
    flag
end

anylowercase3("APa")

#==============================#
function anylowercase4(s)
    flag = false
    for c in s
        flag = flag || islowercase(c)
    end
    flag
end

anylowercase4("APA")

#==============================#
function anylowercase5(s)
    for c in s
        if !islowercase(c)
            return false
        end
    end
    true
end

anylowercase5("APa")
#==============================================================================#
#Exercise 8-10
function rotatedword(word::String, offset::Int64)
    offset = abs(offset) % 26
    len = sizeof(word)
    rotated_char_array = Array{Char, 1}(undef, len)
    k = 0
    for c in word
        k +=1
        rotated_char_array[k] = Char(Int(c) + a)
    end
    return String(rotated_char_array)
end

arstr = rotatedword("baNaNa", 3)
