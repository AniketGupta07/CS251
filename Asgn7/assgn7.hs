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


is_prime x n  = if x <= 1 
                then 0 
                else if x == n 
                        then 1 
                else if (mod x n) == 0 
                        then 0 
                else is_prime x (n+1)

prime_tmp x c n = if n <= 0 
                then -1 
                else if (((is_prime x 2) == 1 ) && c == n)
                        then x 
                else if (is_prime x 2 == 1 ) 
                        then prime_tmp (x+1) (c+1) n 
                else prime_tmp (x+1) c n

prime n = prime_tmp 1 1 n

prime_inf = [prime i | i<-[1..]]


