module H06CaseExpressions where


describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty list"
                                               [x] -> "a single element"
                                               xs -> "a longer list"
