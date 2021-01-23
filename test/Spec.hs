import Test.Hspec
import Network.HTTP.Conduit
import qualified Data.ByteString.Lazy as B (toStrict)
import Lib

main :: IO ()
main = do
    image_png <- simpleHttp "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Haskell-Logo.svg/1200px-Haskell-Logo.svg.png"
    image_jpg <- simpleHttp "https://d1fmx1rbmqrxrr.cloudfront.net/cnet/optim/i/edit/2019/04/eso1644bsmall__w770.jpg"
    image_jpg2 <- simpleHttp "https://blog-fr.orson.io/wp-content/uploads/2017/06/jpeg-ou-png.jpg"
    hspec $
      describe "check image type" $ do
        it "should be a png" $
          matchBytestringTypes (B.toStrict image_png) `shouldBe` ["png"]
        it "should be a jpeg" $
          matchBytestringTypes (B.toStrict image_jpg) `shouldBe` ["jpeg"]
        it "should be a png" $
          matchBytestringTypes (B.toStrict image_png) `shouldBe` ["png"]