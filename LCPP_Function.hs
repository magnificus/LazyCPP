module LCPP_Function where

import Text.Regex
import qualified Matcher

-- this just translates to a define for now
lcpp_matcher_regex = mkRegex "LCPP_FUNCTION .* "
lcpp_function s = "#define " ++ (Matcher.identifier first) ++ "(" ++ (Matcher.firstP first) ++ ")" ++ second 
    where first = drop 14 s
          second = Matcher.afterEq s


