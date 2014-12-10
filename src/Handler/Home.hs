module Handler.Home where

import Handler.Markdown
import Settings.StaticFiles
import Import
import Text.Julius
import Layout

getHomeR :: Handler Html
getHomeR = applicationLayout $ do
  setTitle "Connect Prototype UI"
  addScriptRemote "http://code.jquery.com/jquery-2.1.1.min.js"
  addStylesheetRemote "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
  addScriptRemote "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"
  addStylesheet $ StylesheetR "material.min.css"
  addStylesheet $ StylesheetR "ripples.min.css"
  addScript $ JavascriptR "angular.min.js"
  addScript $ JavascriptR "angular-resource.min.js"
  addScript $ JavascriptR "angular-route.min.js"
  addScript $ JavascriptR "material.min.js"
  addScript $ JavascriptR "ripples.min.js"
  addScript $ JavascriptR "application.js"
  toWidgetHead $(juliusFileReload "templates/test.julius")
  $(widgetFile "container")

--    <img src=@{StaticR image_jpg }/>
-- vim: sw=2:ts=2:et
