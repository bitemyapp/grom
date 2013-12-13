module Main where

import System.Directory
import System.Environment

replPort file err = do
  cwd <- getCurrentDirectory
  envgrench <- getEnv "GRENCH_PORT"
  putStrLn envgrench

help args = putStrLn "grom eats your Clojure code and tells you to use Haskell instead"
helpArgs = ["--help", "-h", "-?", "help"]

version args = putStrLn "grom 0.1\n"
versionArgs = ["--version", "-v", "version"]

eval args = putStrLn "implement eval"
evalArgs = ["eval"]

mn args = putStrLn "implement main"
mnArgs = ["main"]

repl args = putStrLn "implement repl"
replArgs = ["repl"]

lein args = putStrLn "implement lein"
leinArgs = ["lein"]

dispatch args = do
    let matchees = [helpArgs, versionArgs, evalArgs,
                    mnArgs, replArgs, leinArgs]
    let matched = map or $ map (\cmd -> map (\arg -> elem arg args) cmd) matchees
    case matched of
      [True, _, _, _, _, _] -> help args
      [_, True, _, _, _, _] -> version args
      [_, _, True, _, _, _] -> eval args
      [_, _, _, True, _, _] -> mn args
      [_, _, _, _, True, _] -> repl args
      [_, _, _, _, _, True] -> lein args
      [_, _, _, _, _, _]    -> help args

-- port_err = "Couldn't read port from .nrepl-port or $GRENCH_PORT.\n"

main = do
  args <- getArgs
  dispatch args
