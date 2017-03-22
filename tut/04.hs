-- Creating functions, basic types
main :: IO ()
main = do
    sayHello
    sayHello
    sayHello
    sayLoudly "I said hello"

    putStrLn (accentuate "Hello" '?')

exclaim :: String -> String
exclaim phrase = phrase ++ "!!!"


accentuate :: String -> Char -> String
accentuate phrase punctuation =
    phrase ++ (replicate 3 punctuation)


sayHello :: IO ()
sayHello = putStrLn "hello"

-- sayLoudly :: String -> IO ()
sayLoudly :: _
sayLoudly phrase = putStrLn (exclaim phrase)
