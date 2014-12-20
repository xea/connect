module Authorization where

isAdmin = do
  authId <- maybeAuthId
  return $ case authId of
    Nothing -> AuthenticationRequired
    Just _ -> Unauthorized "Administrator privileges are required"
