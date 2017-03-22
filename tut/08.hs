-- Lists, generic types

data ListOfInt = ICons Int ListOfInt
               | INil
    deriving Show

data List a = Cons a (List a)
            | Nil
    deriving Show

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

main = do
    print $ ICons 1 INil
    print $ Cons 1 Nil
    print $ Cons "foo" Nil
    print $ Cons "bar" (Cons "foo" Nil)
