import Base: in, isempty, AbstractSet, HasEltype, @default_eltype, EltypeUnknown, IteratorEltype

# this doens't really work
# I tried to copy stuff from base julia's Set type
# I learnt a lot, so marking this as done for now
struct CustomSet{T} <: AbstractSet{T}
    dict::Dict{T,Nothing}

    Set{T}() where {T} = new{T}(Dict{T,Nothing}())
    Set{T}(s::Set{T}) where {T} = new{T}(Dict{T,Nothing}(s.dict))
end

CustomSet() = CustomSet{Any}()


CustomSet(itr) = _CustomSet(itr, IteratorEltype(itr))

_CustomSet(itr, ::HasEltype) = CustomSet{eltype(itr)}(itr)

function _CustomSet(itr, ::EltypeUnknown)
    T = @default_eltype(itr)
    (isconcretetype(T) || T === Union{}) || return grow_to!(CustomSet{T}(), itr)
    return CustomSet{T}(itr)
end

CustomSet([1,2,3])



isempty(s::CustomSet) = isempty(s.dict)
length(s::CustomSet)  = length(s.dict)
in(x, s::CustomSet) = haskey(s.dict, x)
push!(s::CustomSet, x) = (s.dict[x] = nothing; s)
pop!(s::CustomSet, x) = (pop!(s.dict, x); x)
pop!(s::CustomSet, x, default) = (x in s ? pop!(s, x) : default)

disjoint(s1::CustomSet, s2::CustomSet) = isempty(intersect(s1, s2))

complement(s1::CustomSet, s2::CustomSet) = setdiff(s1, s2)
complement!(s1::CustomSet, s2::CustomSet) = setdiff!(s1, s2)


