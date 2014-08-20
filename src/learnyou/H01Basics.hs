module Main where

doubleMe x = x + x

-- and else is always mandatory
doubleSmallNumber x = if x > 100 then x else x + x

myarray = [ 1, 2, 3, 4]
otherarray = [ 5, 6, 7, 8]

-- concatenating is done with the ++ operator
combinedarray = myarray ++ otherarray

-- prepending is done with the : operator
prepended = 0 : myarray

-- array indexing is done with the !! operator
fourth = combinedarray !! 4

thehead = head myarray
thetail = tail myarray
theinit = init myarray
thelast = last myarray

thelength = length myarray
isnull = null []
thereverse = reverse myarray
firstthree = take 3 myarray
cropped = drop 3 myarray

thegreatest = maximum myarray
thesmallest = minimum myarray
thesum = sum myarray
theproduct = product myarray
iselem = elem 4 myarray

-- ranges
numberrange = [1..20]
letterrange = ['a'..'k']

-- ranges with stepping
range_with_steps = [2, 4..20]
range_with_longer_steps = [3, 6..100]
reverse_range = [20, 19..1]

-- we can also cycle, repeat or replicate arrays
cycling = take 10 (cycle [1, 2, 3])
repeated = take 3 (repeat 5)
replicated = replicate 3 5
