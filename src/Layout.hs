module Layout(applicationLayout) where

import Foundation
import Yesod

applicationLayout :: Widget -> Handler Html
applicationLayout widget = do
  pc <- widgetToPageContent widget
  withUrlRenderer
    [hamlet|
      $doctype 5
        <html ng-app>
          <head>
            <title>#{pageTitle pc}
            <meta charset=utf-8>
            ^{pageHead pc}
          <body>
            ^{pageBody pc}
    |]
 
-- vim: ts=2:sw=2:et  
