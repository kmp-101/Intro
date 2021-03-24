function distance(x₁, y₁, x₂, y₂)
    Δx = x₂ - x₁
    Δy = y₂ - y₁
    @show Δx Δy
    return 0.0
end

distance(1, 2, 3, 4)
#==============================================================================#
function isdivisible(x, y)
    x % y == 0
end

isdivisible(123,22)
#==============================================================================#
function isbetween(x, y, z)
	x ≤ y ≤ z
end

isbetween(1, 15, 10)
#==============================================================================#
function fact(n)
    if n == 0
        return 1
    else
        recurse = fact(n - 1)
        return n * recurse
    end
end

fact(4)
#==============================================================================#
function fib(n)
    if n == 0
        return 0
    elseif n == 1
        return 1
    else
        return fib(n - 1) + fib(n - 2)
    end
end

fib(7)
#==============================================================================#
function fact(n)
    if !(n isa Int64)
        error("Factorial is only defined for integers.")
    elseif n < 0
        error("Factorial is not defined for negative integers.")
    elseif n == 0
        return 1
    else
        return n * fact(n - 1)
    end
end

fact(1.5)
#==============================================================================#
function fact(n)
    space = " "^(4 * n)
    println(space, "factorial ", n)
    if n == 0
        println(space, "returning 1")
        return 1
    else
        recurse = fact(n - 1)
        result = n * recurse
        println(space, "returning ", result)
        return result
    end
end

fact(4)
#==============================================================================#
#Exercise 6-6
function frst(word)
    first = firstindex(word)
    word[first]
end

function lst(word)
    last = lastindex(word)
    word[last]
end

function middle(word)
    first = firstindex(word)
    last = lastindex(word)
    word[nextind(word, first):prevind(word, last)]
end

function ispalindrome_prel(word, flag=true)
    println("$(length(word))")
    if length(word) <= 1
        println("last $(length(word))")
        return flag
    elseif !(frst(word) == lst(word))
        flag = false
        println("1st $flag")
        return flag
    end
    flag = ispalindrome_prel(middle(word), flag)
    println("2nd $flag")
    return flag
end

ispalindrome_prel("abc")
#====================#
function ispalindrome(word, flag=true)
    if length(word) <= 1
        return flag
    elseif !(frst(word) == lst(word))
        flag = false
        return flag
    end
    flag = ispalindrome_prel(middle(word), flag)
    return flag
end

ispalindrome("")
#==============================================================================#
#Exercise 6-7
function ispower_prel(a, b, flag=false)
    println("1st $a")
    if a == 1
        flag = true
        return flag
    elseif a % b > 0
        println("2nd $a")
        flag = false
        return flag
    else
        println("3rd $a")
        flag = ispower_prel(a ÷ b, b, flag)
    end
    return flag
end

ispower_prel(1, 2)
#====================#
function ispower(a, b, flag=false)
    if !(typeof(a)==Int64) || a < 1
        println("Input has to be a positive integer.")
        return flag = nothing
    elseif a == 1
        return flag = true
    elseif a % b > 0
        return flag = false
    else
        flag = ispower(a ÷ b, b, flag)
    end
    return flag
end

ispower(16, 2)
#==============================================================================#
#Exercise 6-8
"""
One way to find the GCD of two numbers is based on the observation that
 if r is the remainder when a is divided by b, then gcd(a, b) = gcd(b, r).
     As a base case, we can use gcd(a, 0) = a.
"""

function GCD(a, b)
    if b == 0
        return a
    else
        r = b
        b = a % r
        a = r
        GCD(a, b)
    end
end

GCD(15, 10)
#==============================================================================#
