module Connect.Validator where

import Import
import Connect.Core ()
import Connect.Util
import Data.Char (toLower)

checkR :: Maybe Request -> Response -> String
checkR Nothing _ = "error"
checkR (Just req) resp = case (validateR req resp) of
                            True -> "ok"
                            False -> "error"

-- verifies whether the given response matches any of the accepted answers of the request
validateR :: Request -> Response -> Bool
validateR req resp = any (matchR $ responseText resp) $ acceptedAnswers req

-- verifies whether the given two input strings are considered matching
matchR :: String -> String -> Bool
matchR expected actual = (unwords . words . (map toLower) $ expected) == (unwords . words . (map toLower) $ actual)
