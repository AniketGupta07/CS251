
insertAt :: a -> [a] -> Int -> [a]

insertAt el li p |p > (length li + 1) = error "TRY AGAIN"
                 |otherwise = (take (p-1) li) ++ [el] ++ 
                 reverse (take (length li - p + 1)(reverse li))
