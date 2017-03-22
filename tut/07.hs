data WeekDay = Sunday
             | Monday
             | Tuesday
             | Wednesday
             | Thursday
             | Friday
             | Saturday
             deriving (Show, Enum)

main = do
    print [Sunday .. Saturday]

    let day = Wednesday
        activity = case day of
            Sunday -> "Walking"
            Monday -> "Talking"
            Friday -> "Rocking"
            _      -> "Mocking"

    print (day, activity)
