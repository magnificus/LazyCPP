module LazyCPP where

import qualified Control.Monad as Monad

import Data.Map (Map, (!))
import qualified Data.Map as Map
import Data.List.Split as Split



lcpp_function s = "int" ++ (identifier s) ++ "() { \n return 0; \n }" 

content s = init $ concatMap(++ " ") . tail $ splitS s
identifier = head . splitS
splitS = Split.splitOn " "

getInterpreted :: String -> Maybe String
getInterpreted s = if (Map.member iden specialCommands) then Monad.liftM (specialCommands ! iden) (return (content s)) else (return s)
    where iden = identifier s
 
specialCommands = Map.fromList [("LCPP_FUNCTION", lcpp_function)]

main = do
    contents <- readFile "input/infile.lcpp"
    let contentLines = lines contents
    writeFile "output/outfile.cpp" contents
