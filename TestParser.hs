import Control.Monad (when)

main = do
    contents <- readFile "input/infile.lcpp"
    let newContents = map id contents
    when (length newContents > 0) $
        writeFile "output/outfile.cpp" newContents
