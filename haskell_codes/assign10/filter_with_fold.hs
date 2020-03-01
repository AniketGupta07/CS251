
fun f xs y = if f y == True
	           then xs ++ [y]
             else 
             	xs

filter1 f xs =  foldl (fun f) [] xs
