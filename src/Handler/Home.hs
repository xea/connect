module Handler.Home where

import Handler.Markdown
import Settings.StaticFiles
import Import

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
  setTitle "Connect Prototype UI"
  addScriptRemote "http://code.jquery.com/jquery-2.1.1.min.js"
  addStylesheetRemote "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
  addStylesheetRemote "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"
  [whamlet|
    <div .container>
    <h1>Connect Prototype UI
    <img src=@{StaticR image_jpg}/>
  |]
-- vim: sw=2:ts=2:et
