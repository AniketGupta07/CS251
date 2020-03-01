
combinations n [] = []
combinations 0 xs = [""]
combinations n (l:ls) | (length (l:ls)) <= n = [l:ls]
                      | otherwise            = (map (\x -> [l] ++ x) (combinations (n-1) ls)) ++ (combinations n ls)
