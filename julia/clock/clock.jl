import Base: +, -, show
using Dates
import Printf

struct Clock
    hour::Int64
    minute::Int64
    
    function Clock(hour, minute)

        total_mins = hour * 60 + minute

        new(
            rem(div(total_mins, 60, RoundDown),  24, RoundDown),
            rem(total_mins, 60, RoundDown)
        )
    end
end



function +(a::Clock, b::Clock)
    Clock(a.hour + b.hour, a.minute + b.minute)
end


function +(a::Clock, b::Minute)
    Clock(a.hour, a.minute + b.value)
end

function -(a::Clock, b::Clock)
    Clock(a.hour - b.hour, a.minute, b.minute)
end


-(a::Clock, b::Minute) = a + -b


show(a::Clock) = Printf.@sprintf "\"%02d:%02d\"" a.hour a.minute
sprint(::Function,a::Clock) = show(a::Clock)
