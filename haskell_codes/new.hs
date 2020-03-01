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


multi cs a q  q_p = do
                    let q_0 = last q 

                    if cs > 0                         
                      then do                           
                        if q_0 == q_p
                        	then do  
                        		-- let temp = shifter a q
                                --     a_n = take n temp 
                                --     q_n = drop n temp
                                --     q_0_n = q_0
                                -- putStrLn a_n
                                -- putStrLn q_n
                                -- putStrLn q_0_n
                                putStrLn q
                                -- multi (cs - 1) a_n q_n q_0_n
                        else if q_0 == '0' && q_p == '1'
                            then do
                            	-- let ac = adder a q_n
                            	-- let temp = shifter a q 
                             --    let a_n = take n temp 
                             --    let q_n = drop n temp
                             --    let q_0_n = q_0
                             --    putStrLn a_n
                             --    putStrLn q_n
                             --    putStrLn q_0_n
                             --    multi (cs - 1) a_n q_n q_0_n
                               putStrLn q
                        else do  
                            -- let ac = adder a (two_complement q)
                            -- let temp = shifter a q 
                            -- let a_n = take n temp 
                            -- let q_n = drop n temp
                            -- let q_0_n = q_0
                            --     putStrLn a_n
                            --     putStrLn q_n
                            --     putStrLn q_0_n
                            --     multi (cs - 1) a_n q_n q_0_n
                            putStrLn q                     	
                    else do
                        return ()                   
main = do
    putStrLn "ASD"
	multi 4 "0010" "0011" '0'
	-- return ()