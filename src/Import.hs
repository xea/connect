module Import
    ( module Import
    , module X
    ) where

import Data.Default
import Foundation          as X
import Language.Haskell.TH
import Settings.StaticFiles
import Yesod               as X
import Yesod.Default.Util
import Yesod.Form.Jquery   as X (urlJqueryJs)
import Yesod.Static

widgetFile :: FilePath -> ExpQ
widgetFile = widgetFileReload def

-- vim: ts=2:sw=2:et
