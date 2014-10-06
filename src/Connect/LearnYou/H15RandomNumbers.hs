module Connect.LearnYou.H15RandomNumbers where

import System.Random

-- mkStdGen creates a random number generator with the given seed
rndnum1 = random (mkStdGen 10) :: (Int, StdGen)

-- random can generate any random values of Random typeclass
rndbool1 = random (mkStdGen 24) :: (Bool, StdGen)

-- randoms generates a stream of random numbers
rndArray1 = take 10 $ randoms (mkStdGen 11) :: [Float]

-- randomR generates a random number within the provided ranges
-- rndnum2 = randomR (1,6) (mkStdGen 35935335)

-- randomRs generates a stream of ranged random numbers
-- rnndarray2 = take 10 $ randomRs (1, 4) (mkStdGen 33)
