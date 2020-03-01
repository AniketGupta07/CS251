shifter xs ys =   take 1 (reverse ys) ++ xs ++ reverse (drop 1 (reverse ys))
 
adder_t c [] _ = []
adder_t c _ [] = []  
adder_t c (x:xs) (y:ys) | c == '0' && x == '0' && y == '0' = '0' : (adder_t '0' xs ys)
                        | c == '0' && x == '0' && y == '1' = '1' : (adder_t '0' xs ys)
                        | c == '0' && x == '1' && y == '0' = '1' : (adder_t '0' xs ys)
                        | c == '0' && x == '1' && y == '1' = '0' : (adder_t '1' xs ys)
                        | c == '1' && x == '0' && y == '0' = '1' : (adder_t '0' xs ys)
                        | c == '1' && x == '0' && y == '1' = '0' : (adder_t '1' xs ys)
                        | c == '1' && x == '1' && y == '0' = '0' : (adder_t '1' xs ys)
                        | c == '1' && x == '1' && y == '1' = '1' : (adder_t '1' xs ys)
                        | otherwise = []

flip_bits [] = [] 
flip_bits (x:xs) | x == '0' = '1':(flip_bits xs)
                 | otherwise = '0':(flip_bits xs) 

two_complement [] = []
two_complement xs = reverse ( adder_t '0' (reverse (flip_bits xs)) ('1':(['0' | x <- [1..(length xs - 1)]])))

-- only adds numbers with equal number of bits
adder xs ys = reverse (adder_t '0' (reverse xs) (reverse ys))





multi cs m q q_p = do
           let q_0 = last q
               n = length q
           if (cs > 0)
            then do
             if (q_0 == q_p )                         
                then do 
                  let temp = shifter m q 
                      a_n = take n temm
                      q_n = drop n temp                     
                  putStrLn "First Case"
                  putStrLn ([q_0] ++" " ++ [q_p])
                  putStrLn a_n
                  putStrLn q_n 
                  multi (cs-1) a_n q_n q_0                    
             else if (q_0 == '0' && q_p == '1')
                then do
                  let ac = adder a m
                      temp = shifter ac q
                      a_n = take n temp
                      q_n = drop n temp                     
                  putStrLn "Second Case"
                  putStrLn ("Adding " ++ ac)
                  putStrLn ([q_0] ++" " ++ [q_p])
                  putStrLn a_n
                  putStrLn q_n

                  multi (cs-1) a_n q_n q_0
             else do
                let ac = adder a (two_complement q)
                    temp = shifter ac q 
                    a_n = take n temp
                    q_n = drop n temp                     
                putStrLn "Third Case"
                putStrLn ("Subtracting " ++ ac)
                putStrLn ([q_0] ++" " ++ [q_p])
                putStrLn a_n
                putStrLn q_n

                multi (cs-1) a_n q_n q_0               
           else do
            return ()

main = do
    putStrLn "ASD"
    n <- getLine 
    x <- getLine
    y <- getLine
    let cs = (read n :: Int)
        -- k = (read n :: Int)
    -- putStrLn (x ++ " " ++ y)
    multi cs x y '0'