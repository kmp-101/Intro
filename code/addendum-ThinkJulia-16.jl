using Printf
#==============================================================================#
struct MyTime
	hour :: Int64
	minute :: Int64
	second :: Int64
end
#==============================================================================#
function MyTime(time::MyTime)
	MyTime(time.hour, time.minute, time.second)
end
#==============================================================================#
struct MyTime
    hour :: Int64
    minute :: Int64
    second :: Int64
    function MyTime(hour::Int64=0, minute::Int64=0, second::Int64=0)
        @assert(0 ≤ minute < 60, "Minute is not between 0 and 60.")
        @assert(0 ≤ second < 60, "Second is not between 0 and 60.")
        new(hour, minute, second)
    end
end
#==============================================================================#
mutable struct mMyTime
	hour :: Int
	minute :: Int
	second :: Int
	function MyTime(hour::Int64=0, minute::Int64=0, second::Int64=0)
 		@assert(0 ≤ minute < 60, "Minute is between 0 and 60.")
		@assert(0 ≤ second < 60, "Second is between 0 and 60.")
	    time = new()
	    time.hour = hour
	    time.minute = minute
	    time.second = second
	    return time
	end
end
#==============================================================================#
function printtime(time::MyTime)
	@printf("%02d:%02d:%02d", time.hour, time.minute, time.second)
end
#==============================================================================#
function Base.show(io::IO, time::MyTime)
    @printf(io, "%02d:%02d:%02d", time.hour, time.minute, time.second)
end
#==============================================================================#
function increment(time::MyTime, seconds::Int64)
    seconds += timetoint(time)
    inttotime(seconds)
end
#==============================================================================#
function +(time::MyTime, seconds::Int64)
	increment(time, seconds)
end
#==============================================================================#
function isafter(t1::MyTime, t2::MyTime)
    (t1.hour, t1.minute, t1.second) > (t2.hour, t2.minute, t2.second)
end
#==============================================================================#
function +(seconds::Int64, time::MyTime)
	time + seconds
end
#==============================================================================#


time = MyTime(13, 3, 02)

printtime(time)
