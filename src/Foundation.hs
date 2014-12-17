module Foundation where

import Network.HTTP.Client.Conduit (Manager)
import Yesod
import Yesod.Static

data App = App { getStatic :: Static, httpManager :: Manager }

instance Yesod App

mkYesodData "App" $(parseRoutesFile "config/routes")

-- vim: sw=2:ts=2:et
