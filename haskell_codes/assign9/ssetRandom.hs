getRandom str1 = do
              g<-newStdgen
              print fst(randomR((0,(length str1)-2)) g)