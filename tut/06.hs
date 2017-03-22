-- Building data
data Foo = Foo Int String

main = do
    -- Constructing a value
    let x = Foo 4 "Four"

    -- Deconstructing a value
    -- (pattern matching)
    let Foo one two = x

    print one
    print two

    -- Constructing with record syntax
    let y = Foo2 { fooOne = 5, fooTwo = "Five" })
    print y
    -- Deconstructing with record syntax
    print (fooOne y)

    -- Modifying with record syntax
    print (y { fooTwo = "Six" })

-- Can define accessors, but it's a pain
getOne (Foo one two) = one
getTwo (Foo one two) = two

-- So we can use records instead
data Foo2 = Foo2
    { fooOne :: Int
    , fooTwo :: String
    }
    deriving Show
