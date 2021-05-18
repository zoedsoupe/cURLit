module Main where

import Get

main :: IO ()
main = get "your_endpoint" >>= putStrLn
