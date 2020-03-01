import Data.Maybe
import Data.List


sdigit2word [] = 0 

sdigit2word x | "one" `elem` x = 1
              | "two" `elem` x = 2
              | "three" `elem` x = 3
              | "four" `elem` x = 4
              | "five" `elem` x = 5
              | "six" `elem` x = 6
              | "seven" `elem` x = 7
              | "eight" `elem` x = 8
              | "nine" `elem` x = 9
              | "zero" `elem` x = 0

ddigit2word [] = 0

ddigit2word x  | "one" == x!!0 = 1
               | "two" == x!!0 = 2
               | "three" == x!!0 = 3
               | "four" == x!!0 = 4
               | "five" == x!!0 = 5               
               | "six" == x!!0 = 6
               | "seven" == x!!0 = 7
               | "eight" == x!!0 = 8
               | "nine" == x!!0 = 9
               | "ten" == x!!0 = 10
               | "eleven" == x!!0 = 11
               | "twelve" == x!!0 = 12
               | "thirteen" == x!!0 = 13
               | "fourteen" == x!!0 = 14
               | "fifteen" == x!!0 = 15
               | "sixteen" == x!!0 = 16
               | "seventeen" == x!!0 = 17
               | "eighteen" == x!!0 = 18
               | "nineteen" == x!!0 = 19
               | "twenty" == x!! 0 = 20 + sdigit2word (tail x)
               | "thirty" == x!! 0 = 30 + sdigit2word (tail x)
               | "forty" == x!! 0 = 40 + sdigit2word (tail x)
               | "fifty" == x!! 0 = 50 + sdigit2word (tail x)
               | "sixty" == x!! 0 = 60 + sdigit2word (tail x)
               | "seventy" == x!! 0 = 70 + sdigit2word (tail x)
               | "eighty" == x!! 0 = 80 + sdigit2word (tail x)
               | "ninety" == x!! 0 = 90 + sdigit2word (tail x)
               | otherwise = 0        


findIndexOf y xs = fromJust (findIndex (\x -> x == y) xs)


tdigit2word [] = 0 
tdigit2word xs = if "hundred" `elem` xs
					then (sdigit2word (take 1 xs))*100 + (ddigit2word (drop 2 xs)) 
				else 
				    ddigit2word xs 

removeelem y xs = [x | x<-xs , x /= y]

string2word xs = let str = (removeelem ',' xs)
                     number = removeelem "and" (words str)
                 in
                 	string2word_t number 


string2word_t number = 	if "million" `elem` number
                     	then 1000000*(tdigit2word (take (findIndexOf "million" number) number)) + 
                     	            (string2word_t (drop ((findIndexOf "million" number) + 1) number))
                    else if "thousand" `elem` number
                     	then 1000*(tdigit2word (take (findIndexOf "thousand" number) number)) + 
                     	            (string2word_t (drop ((findIndexOf "thousand" number) + 1) number))
                    else
                     	tdigit2word number

