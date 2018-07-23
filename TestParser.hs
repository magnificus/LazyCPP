module LazyCPP where

import qualified Control.Monad as Monad

import Data.Map (Map, (!))
import qualified Data.Map as Map
import Data.Maybe

import LCPP_Function
import LCPP_Filter
import Matcher
import Text.Regex

includes = ["<iostream>", "<algorithm>"]


-- these bad boys recursively matches all pattern matches with the function they should be exchanged with
combine r f (s1,s2,s3,s4) = s1 ++ (f s2) ++ (findApplyMatching r s3 f)
findApplyMatching r s f = fromMaybe s $ Monad.liftM (combine r f) (matchRegexAll r s)

matchings = [(lcpp_matcher_regex, lcpp_function)]

applyAllMatchings s = foldl (\s (r, f) -> findApplyMatching r s f) s matchings

main = do
    contents <- readFile "input/infile.lcpp"
    let modifiedContents = applyAllMatchings contents
    writeFile "output/outfile.cpp" modifiedContents
