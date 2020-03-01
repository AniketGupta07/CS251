convert :: (Double, [Char]) -> (Double, [Char] )

convert (x,y) 
      | y == "m" = (x*1.09361 , "yd"
      | y == "yd" = (x/1.09361 , "m"
      | y == "L" = (x*0.264172, "gal"
      | otherwise = error "BITCH!! ENTER VALID VALUE"
