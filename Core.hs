module Core where

import Import
import Content
import Data.Char (toLower)
import System.Random
{- Hash generation -}
import Crypto.Hash.SHA1 as SHA1
import Data.ByteString.Char8 as BS (pack, unpack)
import Text.Printf (printf)
{- JSON -}
import Data.Aeson()
import Data.Text as T (pack, unpack)
import GHC.Generics
import qualified Data.ByteString.Lazy as BL()

{- Type definition -}
data Request = Request { displayText :: String, acceptedAnswers :: [ String ] } deriving (Show, Read, Generic)
data Response = Response { responseText :: String } deriving (Show, Read, Generic)


-- Class of types that can be stored in a Yesod session (i.e. can be converted from/to Text)
class (Show a, Read a) => SessionObject a where
  toSession :: a -> Text
  toSession x = T.pack $ show x
  fromSession :: Maybe Text -> Maybe a
  fromSession Nothing = Nothing
  fromSession (Just x) = Just (read $ T.unpack x)
  
instance SessionObject Request

instance FromJSON Request
instance FromJSON Response
instance ToJSON Request
instance ToJSON Response

{- Save functions -}
hashS :: String -> String
hashS input = (BS.unpack $ SHA1.hash $ BS.pack input) >>= printf "%02x"

{- Validation functions -}
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

{- Content generation -}

nextChallenge :: String -> StdGen -> Request
nextChallenge ref gen = Request question answers where (question, answers) = generateContent ref gen

