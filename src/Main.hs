module Main where

import Data.Maybe
import System.Environment

help args = putStrLn "grom eats your Clojure code and tells you to use Haskell instead"
help_args = ["--help", "-h", "-?", "help"]

version args = putStrLn "grom 0.1\n"
version_args = ["--version", "-v", "version"]

eval args = putStrLn "implement eval"
eval_args = ["eval"]

mn args = putStrLn "implement main"
mn_args = ["main"]

repl args = putStrLn "implement repl"
repl_args = ["repl"]

lein args = putStrLn "implement lein"
lein_args = ["lein"]

dispatch args = do
    let matchees = [help_args, version_args,
                    eval_args, mn_args, repl_args, lein_args]
    let matched = map or $ map (\cmd -> map (\arg -> elem arg args) cmd) matchees
    case matched of
      [True, _, _, _, _, _] -> help args
      [_, True, _, _, _, _] -> version args
      [_, _, True, _, _, _] -> eval args
      [_, _, _, True, _, _] -> mn args
      [_, _, _, _, True, _] -> repl args
      [_, _, _, _, _, True] -> lein args

-- port_err = "Couldn't read port from .nrepl-port or $GRENCH_PORT.\n"

main = do
  args <- getArgs
  dispatch args
