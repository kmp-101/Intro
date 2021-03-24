function subtract(d1, d2)
    res = Dict()
    for key in keys(d1)
        if key ∉ keys(d2)
            res[key] = nothing
        end
    end
    return res
end
#==============================================================================#
function subtract(d1, d2)
    setdiff(d1, d2)
end
#==============================================================================#
function hasduplicates(t)
    d = Dict()
    for x in t
        if x ∈ d
            return true
        end
        d[x] = nothing
    end
    false
end
#==============================================================================#
function hasduplicates(t)
    length(Set(t)) < length(t)
end
#==============================================================================#
function usesonly(word, available)
    for letter in word
        if letter ∉ available
            return false
        end
    end
    true
end
#==============================================================================#
function usesonly(word, available)
    Set(word) ⊆ Set(available)
end
#==============================================================================#
function usesonly(word, available)
  r = Regex("[^$(available)]")
  !occursin(r, word)
end
#==============================================================================#
struct Fibonacci{T<:Real} end
Fibonacci(d::DataType) = d<:Real ? Fibonacci{d}() : error("No Real type!")

Base.iterate(::Fibonacci{T}) where {T<:Real} = (zero(T), (one(T), one(T)))
Base.iterate(::Fibonacci{T}, state::Tuple{T, T}) where {T<:Real} = (state[1],
    (state[2], state[1] + state[2]))
#==============================================================================#
for e in Fibonacci(Int64)
    e > 100 && break
    print(e, " ")
end
#==============================================================================#
function squaresum(a::Float64, b::Float64)
    a^2 + b^2
end
#==============================================================================#








#==============================================================================#
