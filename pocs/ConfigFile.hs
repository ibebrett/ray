import Options.Applicative
import Data.Monoid

data RayConfig = RayConfig {
    sceneFile :: String,
    outputPath :: String
}

rayParser :: Parser RayConfig
rayParser = RayConfig
    <$> argument str mempty
    <*> argument str mempty

main :: IO ()
main = execParser opts >>= renderScene
    where opts = info (helper <*> rayParser) mempty


renderScene :: RayConfig -> IO ()
renderScene opts = putStrLn $ sceneFile opts
