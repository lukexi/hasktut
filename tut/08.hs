-- Monads
main = do
    print results
    print lookups

-- List monad
results = do
    x <- [0..10]
    y <- [1..11]
    z <- [2..12]
    return (x,y,z)


-- Maybe monad
assocs = [("x", 11), ("y", 7), ("z", 2)]

lookups = do
    x <- lookup "x" assocs
    y <- lookup "y" assocs
    z <- lookup "z" assocs
    return (x,y,z)
