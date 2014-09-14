module Connect.Euler.P007Prime10001 (prime10001) where

import Data.Numbers.Primes

prime10001 = last $ take 10001 primes
