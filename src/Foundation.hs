module Foundation where

import Yesod
import Yesod.Default.Util
import Yesod.Form.Jquery
import Yesod.Static

data App = App { getStatic :: Static }

instance Yesod App

{- Yesod routes -}
mkYesodData "App" [parseRoutes|
    /               HomeR         GET
    /markdown       MarkdownR     PUT
    /data           DataR         GET
    /js/#String     JavascriptR   GET
    /css/#String    StylesheetR   GET
    /static         StaticR   Static getStatic
|]

-- vim: sw=2:ts=2:et
