import Data.Maybe

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

countLetters str c = length $ filter (== c) str

faulty xs | (countLetters xs '0') == (countLetters xs '1') = 1 
          | otherwise = 0

-- only adds numbers with equal number of bits
adder xs ys | (faulty xs) == 1 || (faulty ys) == 1 = Nothing 
	        | otherwise  = Just (reverse (adder_t '0' (reverse xs) (reverse ys)))


multi cs a m q q_p = do
	           let q_0 = last q
	               n = length q
	           if (cs > 0)
	            then do
	             if (q_0 == q_p )                         
	                then do 
	                  let temp = shifter a q 
	                      a_n = take n temp
	                      q_n = drop n temp                     
	                  -- putStrLn "First Case"
	                  putStrLn ("q_0: " ++ [q_0] ++" q_-1: " ++ [q_p])
	                  putStrLn ("AC is " ++ a_n)
	                  putStrLn ("QR is " ++ q_n)
	                  putStrLn ("BR is " ++ m)  

	                  multi (cs-1) a_n m q_n q_0                    
	             else if (q_0 == '0' && q_p == '1')
	                then do
	                  let ac = fromMaybe "Error" (adder a m)------ Adder is here
	                  if(ac == "Error")
	                  	then do
	                  		putStrLn ("--------" ++ ac ++"--------")
                            -- putStrLn "New INPUT"
	                  		main 
	                  else do
		                      
		                  let temp = shifter ac q 
		                      a_n = take n temp
		                      q_n = drop n temp                     
		                  -- putStrLn "Second Case"
		                  putStrLn ("After Adding " ++ ac)
		                  putStrLn ("q_0: " ++ [q_0] ++" q_-1: " ++ [q_p])
		                  putStrLn ("AC is " ++ a_n)
		                  putStrLn ("QR is " ++ q_n)
		                  putStrLn ("BR is " ++ m)
                          -- putStrLn ("BR is " ++ m)
		                  multi (cs-1) a_n m q_n q_0
	             else do
	                let ac = fromMaybe "Error" (adder a (two_complement m)) --- Adder here
	                if(ac == "Error")
	                  	then do
	                  		putStrLn ("--------"++ac++"--------")
	                  		-- putStrLn "New INPUT"
	                  		main 
	                else do
		                let temp = shifter ac q 
		                    a_n = take n temp
		                    q_n = drop n temp                         
		                -- putStrLn "Third Case"
		                putStrLn ("After Subtracting " ++ ac)
		                putStrLn ("q_0: " ++ [q_0] ++" q_-1: " ++ [q_p])
		                putStrLn ("AC is " ++ a_n)
		                putStrLn ("QR is " ++ q_n)
		                putStrLn ("BR is " ++ m)
                        
		                multi (cs-1) a_n m q_n q_0               
	           else do
	           	putStrLn "Answer"
	           	putStrLn (a ++ q)
	            -- return ()

main = do
    putStrLn "Enter number of bits"
    n <- getLine 
    putStrLn "Enter the 2 numbers "
    x <- getLine
    y <- getLine
    let cs = (read n :: Int)
        k = ['0' | x<-[1..(cs)]]
    
    multi cs k x y  ('0')