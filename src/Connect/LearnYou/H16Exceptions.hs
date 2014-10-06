module Connect.LearnYou.H16Exceptions where

import System.Environment
import System.IO
import System.IO.Error

myexception = catchIOError toTry handler

toTry :: IO ()
toTry = do
    (fileName:_) <- getArgs
    contents <- readFile fileName
    putStrLn $ "The file has " ++ show (length(lines contents)) ++ " lines"

handler :: IOError -> IO ()
handler e
    | isDoesNotExistError e = putStrLn "The selected file does not exist"
    | otherwise = ioError e
