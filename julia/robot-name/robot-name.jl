import Printf

global names = Set{String}()


function make_name!()
    letters = string(rand('A':'Z', 2)...)
    numbers = Printf.@sprintf("%0.3d", rand(0:999))
    name = "$letters$numbers"
    global names
    if name ∈ names
        return make_name!()
    else
        push!(names, name)
        return name
    end
end


make_name!()


mutable struct Robot
    name::String

    function Robot()
        new(make_name!())
    end
end

function reset!(instance::Robot)
    # uncomment this if the same robot name can be re-assigned later
    # pop!(names, instance.name)
    instance.name = make_name!()
end

function name(instance::Robot)
    instance.name
end
