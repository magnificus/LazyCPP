module LCPP_Filter where

import Matcher
import Text.Regex


lcpp_filter_regex = mkRegex ("LCPP_FILTER" ++ Matcher.maxParenthesis)
