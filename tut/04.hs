-- Creating functions
main = do
    sayHello
    sayHello
    sayHello
    sayLoudly "I said hello"

sayHello = putStrLn "hello"

sayLoudly phrase = putStrLn (phrase ++ "!!!")
