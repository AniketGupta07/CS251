

fun x y = do 
        if (x == y)
           then do     putStrLn "Good"
        else do
                 return ()


main = do 
      putStrLn "Enter a number"
      x <- getLine
      y <- getLine
      let a = (read x ::Int)
          b = (read y :: Int)
      fun a b
      -- let a = reverse "asd"
      -- print a
