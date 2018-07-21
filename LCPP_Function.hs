module LCPP_Function where

import Text.Regex
import qualified Matcher

lcpp_matcher_regex = mkRegex "LCPP_FUNCTION .* "
lcpp_function s = "#define " ++ (Matcher.identifier first) ++ "(" ++ (Matcher.firstP first) ++ ")" ++ " " 
    where first = drop 14 s


