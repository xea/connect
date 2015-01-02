module Connect.Util where

import Import
import Connect.Core
{- Hash generation -}
import Crypto.Hash.SHA1 as SHA1
import Data.Aeson()
import Data.ByteString.Char8 as BS (pack, unpack)
import Data.Text as T (pack, unpack)
import GHC.Generics
import Text.Printf (printf)

data Request = Request { requestText :: String, acceptedAnswers :: [ String ] } deriving (Show, Read, Generic)
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

-- Generates hexadecimal string representation of a SHA1 value calculated based on the given input
hashS :: String -> String
hashS input = take 8 $ (BS.unpack $ SHA1.hash $ BS.pack input) >>= printf "%02x"

-- Generates a pseudo-unique identifier for an object
genId :: (Show a) => a -> String
genId = hashS . show 
