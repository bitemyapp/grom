module Client where

import qualified Data.BEncode as BE
import qualified Data.Map as Map
import Network.Socket

-- Map.fromList [("code", "(+ 1 2)"), ("id", "lolsorandom"), ("op", "eval")]
-- (BE.bShow $ BE.BList [(BE.BInt 10), (BE.BInt 20)]) ""
-- (BE.bShow $ BE.BString $ Data.ByteString.Lazy.Char8.pack "blah") ""
