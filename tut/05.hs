-- Getting weird with functions
main = do
    print x1
    print x2
    print x3
    print x4
    print x5
    print x6
    print x7


x1 = 1 + 1 + 1 + 1

x2 = succ (succ (succ 1))

succHard = succ . succ
succHarder = succ . succ . succ

x3 = succHard 1
x4 = succHarder 1



x5 = (2 +) 1
x6 = (+ 2) 1
x7 = (+) 2 1
