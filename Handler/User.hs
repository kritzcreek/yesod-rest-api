{-# LANGUAGE QuasiQuotes, TypeFamilies, GeneralizedNewtypeDeriving, TemplateHaskell,
OverloadedStrings, GADTs, FlexibleContexts #-}

module Handler.User where

import Import

import Database.Persist.Types (PersistValue(PersistInt64))
import Database.Persist.MongoDB
import Database.Persist.Class (PersistEntity(Key))

getUserR :: String -> Handler Value
getUserR str = do
  let json = object ["name" .= ("Adam"::Text)]
  return json

postUserR :: String -> Handler Value
postUserR str = do
  body <- requireJsonBody
  result <- runDB $ Key $ PersistInt64 (fromIntegral 1)
  return $ case result of
    Just val -> val
    Nothing -> "This was a triumph im making a note here huge success"
