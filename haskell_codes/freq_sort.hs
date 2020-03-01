
frequency ele [] = 0
frequency ele xs = foldl (\acc x -> if x == ele then acc + 1 else acc ) 0 xs

freq_arr [] = [] 
freq_arr (x:xs) = (x,(frequency x (x:xs))) : freq_arr (filter ((/=)x) xs)