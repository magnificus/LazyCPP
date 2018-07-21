module Matcher where

import Text.Regex
import Data.Maybe

import Data.List.Split as Split

content s = init $ concatMap(++ " ") . tail $ splitS s
identifier = head . splitS
splitS = Split.splitOn " "
firstP = head . (fromMaybe ["", ""]) . (matchRegex (mkRegex "/(.*/)"))
afterEq = head . (fromMaybe ["", ""]) . (matchRegex (mkRegex "=.*"))
