module Main where

import qualified Control.Monad as Monad

import Data.Map (Map, (!))
import qualified Data.Map as Map
import Data.Maybe
import Data.List

import LCPP_Function
import LCPP_Filter
import LCPP_BaseLibrary
import Matcher
import Text.Regex

includes = ["<iostream>", "<algorithm>"]


-- these bad boys recursively matches all pattern matches with the function they should be exchanged with
combineDestructive r f (s1,s2,s3,_) = s1 ++ (f s2) ++ (findApplyMatching r s3 f)
combineAdditive s (s1,s2,s3,_) = s1 ++ s2 ++ s ++ s3
findApplyMatching r s f = fromMaybe s $ Monad.liftM (combineDestructive r f) (matchRegexAll r s)
applyAllMatchings s = foldl (\s (r, f) -> findApplyMatching r s f) s matchings
-- this function adds the all the base functions referenced in the code 
addBaseFunction s (r, f) = if (isInfixOf r s) then (fromMaybe s $ Monad.liftM (combineAdditive f) (matchRegexAll Matcher.upUntilLastPreLine s)) else (s)
addBaseFunctions s = foldl addBaseFunction s baseFunctions

matchings = [(lcpp_matcher_regex, lcpp_function)]
baseFunctions = [(min_v_regex, min_v), (max_v_regex, max_v)]

main = do
    contents <- readFile "input/infile.lcpp"
    let replacedMatchings = (!! 5) $ iterate applyAllMatchings contents -- transform 5 times
    let addedBaseFunctions = addBaseFunctions replacedMatchings
    writeFile "output/outfile.cpp" addedBaseFunctions
