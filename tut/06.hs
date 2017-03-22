-- Building data
data Foo = Foo Int String

main = do
    let x = Foo 4 "Four"

    let Foo one two = x

    print one
    print two

    let y = Foo2 { fooOne = 5, fooTwo = "Five" })
    print y
    print (fooOne y)

-- Can define accessors, but it's a pain
getOne (Foo one two) = one
getTwo (Foo one two) = two

-- So we can use records instead
data Foo2 = Foo2
    { fooOne :: Int
    , fooTwo :: String
    }
    deriving Show
