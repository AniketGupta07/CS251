
isrange :: Int -> (Int,Int) -> Int
isrange n (a,b) | n >= (a-1) && n <= (b-1)  = 1
				| otherwise = 0
incrange [] (a,b) = []
incrange xs (a,b)  | b > a = error "TRY AGAIN"
                   |otherwise = map (\x -> xs!!x + fromIntegral (isrange x (a,b))) [0..(length xs - 1)]



insertAt :: a -> [a] -> Int -> [a]
insertAt el li p |p > (length li + 1) = error "TRY AGAIN"
                 |otherwise = (take (p-1) li) ++ [el] ++ 
                 reverse (take (length li - p + 1)(reverse li))



combinations n [] = []
combinations 0 xs = [""]
combinations n (l:ls) | (length (l:ls)) <= n = [l:ls]
                      | otherwise            = (map (\x -> [l] ++ x) (combinations (n-1) ls)) ++ (combinations n ls)
