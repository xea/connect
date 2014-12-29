module Connect.Store where

import Connect.Core
import Data.Aeson (decodeStrict)
import Data.Aeson.Encode.Pretty (encodePretty)

instance ToJSON SkillNode
instance FromJSON SkillNode
