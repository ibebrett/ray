import Data.Word
import Codec.Picture
import Codec.Picture.Types

main :: IO ()

off :: Word8
off = 0

on :: Word8
on = 255

blue = PixelRGB8 off off on
white = PixelRGB8 on on on

circleFunc :: Double -> Double -> Double -> PixelRGB8
circleFunc r x y = if dist < r then blue else white
    where dist = sqrt ((x - 150.0)**2 + (y - 100.0)**2)

imageCreator :: String -> IO ()
imageCreator path = writePng path $ generateImage genPixel 300 200
    where genPixel x y = circleFunc 30.0 (fromIntegral x) (fromIntegral y)

main = imageCreator "test.png"
