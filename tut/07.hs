data Weekday = Sunday
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
            Sunday -> "Jumping"
            Monday -> "Talking"
            Friday -> "Climbing"
            _      -> "Dancing"

    putStrLn (show day ++ " is for " ++ activity)


getWeather :: Weekday -> String
getWeather Sunday    = "Sunny"
getWeather Monday    = "Rainy"
getWeather Tuesday   = "Cloudy"
getWeather Wednesday = "Windy"
getWeather Thursday  = "Giraffes"
getWeather Friday    = "Hail"
getWeather Saturday  = "Snow"
