using Printf
#==============================================================================#
struct MyTime
	hour
	minute
	second
end
#==============================================================================#
function printtime(t)
    @printf("%02d:%02d:%02d", t.hour, t.minute, t.second)
end
#==============================================================================#
function isafter(t1, t2)
    t1.hour > t2.hour ||
    (t1.hour == t2.hour && t1.minute > t2.minute) ||
    (t1.minute == t2.minute && t1.second > t2.second)
end
#==============================================================================#
#==
function addtime(t1, t2)
    MyTime(t1.hour + t2.hour, t1.minute + t2.minute, t1.second + t2.second)
end
==#
#==============================================================================#
#==
function addtime(t1, t2)
    second = t1.second + t2.second
    minute = t1.minute + t2.minute
    hour = t1.hour + t2.hour
    if second >= 60
        second -= 60
        minute += 1
    end
    if minute >= 60
        minute -= 60
        hour += 1
    end
    MyTime(hour, minute, second)
end
==#
#==============================================================================#
#==
function increment!(time, seconds)
    time.second += seconds
    if time.second >= 60
        time.second -= 60
        time.minute += 1
    end
    if time.minute >= 60
        time.minute -= 60
        time.hour += 1
    end
end
==#
#==============================================================================#
function increment!(time, seconds)
    t = timetoint(time) + seconds
    return inttotime(t)
end
#==============================================================================#
function timetoint(time)
	minutes = time.hour * 60 + time.minute
    seconds = minutes * 60 + time.second
end
#==============================================================================#
function inttotime(seconds)
    (minutes, second) = divrem(seconds, 60)
    hour, minute = divrem(minutes, 60)
    MyTime(hour, minute, second)
end
#==============================================================================#
#==
function addtime(t1, t2)
    seconds = timetoint(t1) + timetoint(t2)
    inttotime(seconds)
end
==#
#==============================================================================#
function isvalidtime(time)
    if time.hour < 0 || time.minute < 0 || time.second < 0
        return false
    end
    if time.hour >= 24 || time.minute >= 60 || time.second >= 60
        return false
    end
    return true
end
#==============================================================================#
function addtime1(t1, t2)
    if !isvalidtime(t1) || !isvalidtime(t2)
        error("invalid MyTime object in add_time")
    end
    seconds = timetoint(t1) + timetoint(t2)
    inttotime(seconds)
end
#==============================================================================#
function addtime2(t1, t2)
    @assert(isvalidtime(t1) && isvalidtime(t2),
    "invalid MyTime object in add_time")
    seconds = timetoint(t1) + timetoint(t2)
    inttotime(seconds)
end
#==============================================================================#







#==============================================================================#
#printtime(MyTime(10, 57, 30))
#time1 = MyTime(10, 57, 30)
#time2 = MyTime(10, 58, 30)
#isafter(MyTime(10, 58, 29), MyTime(10, 58, 30))
#start = MyTime(9, 45, 0);
#duration = MyTime(1, 35, 0);
done = addtime(start, duration);
printtime(done)
