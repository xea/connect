module H10FunctionComposition where

result = map (negate . negate . abs) [-3, -5, 3, -9]
