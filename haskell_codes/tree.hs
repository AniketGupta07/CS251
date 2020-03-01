data Tree = Leaf Int | Node Int Tree Tree
			deriving (Show, Eq)
			
add :: Tree -> Int

add (Leaf l) = l
add (Node a left right) = a + (add left) + (add right)