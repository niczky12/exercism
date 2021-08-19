const romans = [
    (1000, "M"),
    (900 , "CM"),
    (500 , "D"),
    (400 , "CD"),
    (100 , "C"),
    (90 , "XC"),
    (50 , "L"),
    (40 , "XL"),
    (10 , "X"),
    (9 , "IX"),
    (5 , "V"),
    (4 , "IV"),
    (1 , "I")
]


function to_roman(number::Integer)
    if number <= 0 || number >= 4000
        error()
    end

    roman_number = ""
    for (arabic, roman) in romans
        while arabic <= number
            roman_number *= roman
            number -= arabic
        end
    end
    roman_number
end
