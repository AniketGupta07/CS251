indexOf x str pos | pos == length(str) =(-1) | x == str!!(pos) =pos | otherwise =indexOf( x)(str)(pos+1)
a=['0'..'9']
foo x = indexOf x a 0
foo3 str = map(foo) str
foo2 index arr | index==0 =(arr!!(length(arr)-index-1)) | otherwise =(arr!!(length(arr)-index-1))*(10^(index))+(foo2(index-1)(arr))
final str = foo2(length(str)-1)((foo3(str)))
str2int str |str!!0=='-' =(-1)*final(tail(str)) | otherwise =final(str)
