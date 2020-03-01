import Data.Char

string2int_ num [] = num

string2int_ num (x:xs) = string2int_ num (num*10 + (ord x - 48)) xs