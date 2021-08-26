function allergy_list(score)
    allergy_lookup = [
            "eggs",
            "peanuts",
            "shellfish",
            "strawberries",
            "tomatoes",
            "chocolate",
            "pollen",
            "cats"]

    allergy_codes = digits(score, base=2, pad=8)[1:8]
    Set([allergy_lookup[idx] for idx in findall(x -> x == 1, allergy_codes)])
end

allergic_to(score, allergen) = allergen ∈ allergy_list(score)
