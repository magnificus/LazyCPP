module LCPP_BaseLibrary where

import Text.Regex
import qualified Matcher

mostSomething n c = "template <typename T>\nT LCPP_" ++ n ++ "(std::vector<T> InVector){\n        T temp;\n        for (T a : InVector){\n                temp = a " ++ c ++ " temp ? a : temp;\n        }\n        return temp;\n}"

max_v_regex = "LCPP_max_v"
min_v_regex = "LCPP_min_v"
max_v = mostSomething "min_vector" ">"
min_v = mostSomething "max_vector" "<"
