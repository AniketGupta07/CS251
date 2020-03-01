onedigit num | num==0 ="" | num==1 ="one" | num==2 ="two" | num==3 ="three" | num==4 ="four" | num==5 ="five" | num==6 ="six" | num==7 ="seven" | num==8 = "eight" |num==9 ="nine"

eleven num |num<10 =onedigit(num)|num==10 ="ten" | num==11 ="eleven" | num==12 ="twelve" | num==13 ="thirteen" | num==14 ="fourteen" |num ==15 ="fifteen" | num==16 ="sixteen" |num==17 ="seventeen" |num==18 ="eighteen" | num==19 ="nineteen"

twodigit num | num<20 =eleven(num) | num==20 ="twenty" | num<30 ="twenty " ++ onedigit(num-20) | num<40 ="thirty " ++ onedigit(num-30) | num<50 ="forty " ++ onedigit(num-40) | num<60 ="fifty " ++ onedigit(num-50) | num<70 ="sixty " ++ onedigit(num-60) | num<80 ="seventy " ++ onedigit(num-70) | num<90 ="eighty " ++ onedigit(num-80) | num<100 ="ninety " ++ onedigit(num-90) | otherwise =""

threedigit num |num<100 =twodigit(num)|num ==100 ="one hundred" |num<200 ="one hundred and "++twodigit(num-100) | num ==200 ="two hundred" |num<300 ="two hundred and "++twodigit(num-200) | num ==300 ="three hundred" |num<400 ="three hundred and "++twodigit(num-300) | num ==400 ="four hundred" |num<500 ="four hundred and "++twodigit(num-400) | num ==500 ="five hundred" |num<600 ="five hundred and "++twodigit(num-500) | num ==600 ="six hundred" |num<700 ="six hundred and "++twodigit(num-600) | num ==700 ="seven hundred" |num<800 ="seven hundred and "++twodigit(num-700) | num ==800 ="eight hundred" |num<900 ="eight hundred and "++twodigit(num-800) | num ==900 ="nine hundred" |num<1000 ="nine hundred and "++twodigit(num-900) | otherwise =""

sixdigit num  |num<1000 =threedigit(num)|(num `div` 1000)==0 =threedigit(num)| (num `mod` 1000)==0  =threedigit((num `div` 1000))++" thousand"| otherwise =threedigit((num `div` 1000))++" thousand, "++threedigit(num `mod` 1000) 

ninedigit num |num<1000000 =sixdigit(num)| (num `mod` 1000000)==0 =threedigit((num `div` 1000000))++" million"| otherwise = threedigit((num `div` 1000000))++" million, "++sixdigit(num `mod` 1000000)

twelvedigit num  |num<1000000000 =ninedigit(num)| (num `mod` 1000000000)==0 =threedigit((num `div` 1000000000))++" billion"| otherwise = threedigit((num `div` 1000000000))++" billion, "++ninedigit(num `mod` 1000000000)

str2word num  |num==0 ="zero"|num<1000000000000 =twelvedigit(num)| (num `mod` 1000000000000)==0 =threedigit((num `div` 1000000000))++" trillion"| otherwise = threedigit((num `div` 1000000000000))++" trillion, "++twelvedigit(num `mod` 1000000000000)