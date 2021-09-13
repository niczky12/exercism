function matching_brackets(s)

    BRACKETS = Dict(
        '{' => '}',
        '[' => ']',
        '(' => ')'
    )

    is_opening(bracket::Char) = bracket ∈ keys(BRACKETS)
    is_closing(bracket::Char) = bracket ∈ values(BRACKETS)

    open_brackets = empty(['['])

    for c in s
        if is_opening(c)
            push!(open_brackets, c)
        elseif is_closing(c)
            isempty(open_brackets) && return false
            BRACKETS[open_brackets[end]] != c && return false
            pop!(open_brackets)
        end
    end

    return isempty(open_brackets)
end
