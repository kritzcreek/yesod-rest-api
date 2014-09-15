{-# LANGUAGE TupleSections, OverloadedStrings #-}
module Handler.User where

import Import

getUserR :: String -> Handler Value
getUserR str = do
  let json = object ["name" .= ("Adam"::Text)]
  return json

postUserR :: String -> Handler Value
postUserR str = do
  body <- requireJsonBody
  return body
