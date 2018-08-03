module Matcher where

import Text.Regex
import Data.Maybe

import Data.List.Split as Split

content s = init $ concatMap(++ " ") . tail $ splitS s
identifier = head . splitS
splitS = Split.splitOn " "
maxParenthesis = "[(](.*)[)]" -- matches longest possible parenthesis
minParenthesis = "[(]([^)]*)[)]" -- matches shortest possible parenthesis
firstP = head . (fromMaybe [""]) . (matchRegex (mkRegex minParenthesis))
afterEq = head . (fromMaybe [""]) . (matchRegex (mkRegex "=(.*)"))
