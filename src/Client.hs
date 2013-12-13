module Client where

import qualified Data.BEncode as BE
import Data.ByteString.Lazy.Char8 as BS
import qualified Data.Map.Strict as Map
import Network.Socket

-- Map.fromList [("code", "(+ 1 2)"), ("id", "lolsorandom"), ("op", "eval")]
-- (BE.bShow $ BE.BList [(BE.BInt 10), (BE.BInt 20)]) ""
-- (BE.bShow $ BE.BString $ BS.pack "blah") ""
-- (BE.bShow $ BE.BDict $ Map.fromList [("code", "(+ 1 2)"), ("id", "lolsorandom"), ("op", "eval")]

bstringFromString s = BE.BString $ BS.pack s
bencodeMap m = fmap bstringFromString m

-- Map.fromList [("code", "(+ 1 2)"), ("id", "lolsorandom"), ("op", "eval")]
-- d2:id11:lolsorandom2:ns4:user7:session36:f70b7346-94ae-401c-9ffe-4fbda16077fd5:value1:3ed2:id11:lolsorandom7:session36:f70b7346-94ae-401c-9ffe-4fbda16077fd6:statusl4:doneee

-- 10blahwootAA
