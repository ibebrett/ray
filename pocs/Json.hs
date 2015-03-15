{-# LANGUAGE OverloadedStrings #-}

import Data.Aeson
import Data.Monoid
import Control.Monad
import Control.Applicative

import qualified Data.ByteString.Lazy as B


data Coord = Coord {
    x :: Double,
    y :: Double,
    z :: Double
} deriving Show

instance FromJSON Coord where
    parseJSON (Object v) = Coord <$>
                           v .: "x" <*>
                           v .: "y" <*>
                           v .: "z"
    parseJSON _ = mzero

decodedCoord = decode "{ \"x\": 1.2, \"y\": 1.0, \"z\": 34.3 } " :: Maybe Coord

readJson :: IO B.ByteString
readJson = B.readFile "test.json"

main = do
    jsonData <- readJson
    let coord = decode jsonData :: Maybe Coord
    let displayResult = maybe "bad data" (show) coord
    putStrLn displayResult
