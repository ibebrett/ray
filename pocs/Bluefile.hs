import Data.Word
import Codec.Picture
import Codec.Picture.Types

main :: IO ()

black :: Word8
black = 0

white :: Word8
white = 255

imageCreator :: String -> IO ()
imageCreator path = writePng path $ generateImage genPixel 300 200
    where genPixel x y = PixelRGB8 black black white

main = imageCreator "test.png"
