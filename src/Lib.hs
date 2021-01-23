module Lib where
import Codec.ImageType
import  qualified Data.ByteString as B
import Data.Maybe

matchBytestringTypes :: B.ByteString -> [String]
matchBytestringTypes input = mapMaybe ($ input)
    [testJpeg
    , testPng
    , testGif
    , testTiff
    , testRgb
    , testPbm
    , testPgm
    , testPpm
    , testRast
    , testXbm
    , testBmp
    , testWebp
    , testExr]