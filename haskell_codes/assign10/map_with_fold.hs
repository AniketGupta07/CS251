
fun :: (a->b)->[b]->a->[b]
fun f xs y = xs ++ [f y]

map1 f xs =  foldl (fun f) [] xs
