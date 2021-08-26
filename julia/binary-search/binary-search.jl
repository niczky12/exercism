# this passes the basic tests
function binarysearch_simple(A, x; search_range=1:length(A))
    if isempty(search_range)
        return search_range
    end

    start_point = first(search_range)
    end_point = last(search_range)
    midpoint = start_point + div(end_point - start_point, 2)

    candidate = A[midpoint]

    if candidate == x
        return midpoint:midpoint
    elseif candidate < x
        # we can increment midpoint as we've already tested it
        binarysearch(A, x; search_range=(midpoint+1):end_point)
    else
        binarysearch(A, x; search_range=start_point:(midpoint-1))
    end
end


# # bonus task
# Implement keyword arguments `by`, `lt` and `rev` so that
# `by` specifies a transformation applied to all elements of the list,
# `lt` specifies a comparison and
# `rev` specifies if the list is ordered in reverse.

function binarysearch(A, x; by = identity, lt = <, rev=false, search_range=1:length(A))
    if isempty(search_range)
        return search_range
    end

    start_point = first(search_range)
    end_point = last(search_range)
    midpoint = start_point + div(end_point - start_point, 2)

    candidate = by(A[midpoint])
    to_find = by(x)

    if rev
        reverse_search = !
    else
        reverse_search = identity
    end

    if candidate == to_find
        return midpoint:midpoint
    elseif reverse_search(lt(candidate, to_find))
        # we can increment midpoint as we've already tested it
        binarysearch(A, x; by=by, lt=lt, rev=rev, search_range=(midpoint+1):end_point)
    else
        binarysearch(A, x; by=by, lt=lt, rev=rev, search_range=start_point:(midpoint-1))
    end
end
