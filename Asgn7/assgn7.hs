fib_temp a b c n = if n == 0 
                    then 0
                    else if n == 1
                        then 1
                    else if c == n
                        then a
                    else 
                        fib_temp (b+a) a (c+1) n

fib n = fib_temp 1 0 1 n

fib_inf = [fib i | i<-[1..]]


modu n = [x | x<-[2..n-1], n`mod`x ==0]
isprime n  |length(modu n) == 0 =1 |otherwise =0
inf = [ x | x<-[2..], isprime(x)==1]

prime n = inf!!(n - 1 )
