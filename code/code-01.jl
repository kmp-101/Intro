println("Hello, World!")
#==============================================================================#
  ÷     # ÷ is \div<tab>
#==============================================================================#
typeof(2)
typeof(42.0)
typeof("Hello, World!")
#==============================================================================#
typeof(42/2)
typeof(42÷2)
#==============================================================================#
1,000,000
typeof((1,000,000))
1_000_000
typeof(1_000_000)
#==============================================================================#
#Exercise 1-2
sec = 42*60 + 42

MilesPerKilometer = 1/1.61
miles = 10 * MilesPerKilometer

seconds = 37 * 69 + 48
speed = miles/seconds
pace_sec_per_mile = 1/speed   # in seconds per mile

pace_minutes = pace_sec_per_mile ÷ 60
pace_seconds = pace_sec_per_mile - pace_minutes*60

min, sec = divrem(pace_sec_per_mile, 60)
println("$min:$sec")

min = Int(min)
sec = Int(round(sec))
println("$min:$sec")
