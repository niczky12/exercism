import Dates: Second

const gigasecond = Second(1e9)

add_gigasecond(date::DateTime) = date + gigasecond
