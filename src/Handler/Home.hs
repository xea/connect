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
  addStylesheet $ StylesheetR "material.min.css"
  addStylesheet $ StylesheetR "ripples.min.css"
  addScript $ JavascriptR "material.min.js"
  addScript $ JavascriptR "ripples.min.js"
  addScript $ JavascriptR "application.js"
  toWidget
    [julius|
      $(function() {
      });
    |]
  [whamlet|
    <div .container>
      <div .navbar .navbar-warning>
        <div .navbar-header>
          <form .navbar-form .navbar-left>
            <input .form-control .col-lg-8 type=text>
      <div .alert .alert-dismissable .alert-info>
        <button .close type=button data-dismiss=alert>
        Fufufuufuf
  |]
--    <img src=@{StaticR image_jpg }/>
-- vim: sw=2:ts=2:et
