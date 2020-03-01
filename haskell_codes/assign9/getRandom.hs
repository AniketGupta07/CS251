import System.Random

getRandom = do
              g<-newStdgen
              print fst (randomR (0,(length "asdfdwefwfwfwefw")-2) g)
