module Foundation where

import           Yesod
import           Yesod.Default.Util
import           Yesod.Form.Jquery

data App = App

instance Yesod App

{- Yesod routes -}
mkYesodData "App" [parseRoutes|
    /         HomeR     GET
    /markdown MarkdownR PUT
    /data     DataR     GET
|]

-- vim: sw=2:ts=2:et
