{-# LANGUAGE OverloadedStrings          #-}
import           Hakyll

main :: IO ()
main = hakyll $ do
  match "images/**" $ do
    route idRoute
    compile copyFileCompiler

  match "favicon.ico" $ do
    route idRoute
    compile copyFileCompiler

  match "css/*" $ do
    route idRoute
    compile compressCssCompiler

  match "manpage.html" $ do
    route idRoute
    compile copyFileCompiler

  match "index.html" $ do
    route idRoute
    compile
      $   getResourceBody
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= relativizeUrls

  match (complement "README.md" .&&. "*.md") $ do
    route $ setExtension "html"
    compile
      $   pandocCompiler
      >>= loadAndApplyTemplate "templates/container.html" defaultContext -- wrap in .container
      >>= loadAndApplyTemplate "templates/default.html"   defaultContext
      >>= relativizeUrls

  --  Videos are hardcoded below
  create ["videos.html"] $ do
    route idRoute
    compile $ do
      let videosCtx =
            listField "videos" videoCtx videos
              <> constField "title" "Videos"
              <> defaultContext

      makeItem ""
        >>= loadAndApplyTemplate "templates/videos.html"    videosCtx
        >>= loadAndApplyTemplate "templates/container.html" videosCtx
        >>= loadAndApplyTemplate "templates/default.html"   videosCtx
        >>= relativizeUrls

  match "templates/*" $ compile templateCompiler

 where
  videoCtx = field "vtitle" (return . fst . itemBody)
    <> field "id" (return . snd . itemBody)
  videos = traverse
    makeItem
    [ ("DistroTube: The Best Tiling Window Manager"     , "pY9HPm1N16Y")
    , ("don's screencast 1"                             , "4dyoLS-zOgE")
    , ("don's screencast 2"                             , "LN4Ov6ZLcrI")
    , ("aidenvdh's screencast"                          , "7ZAmMdRBRjs")
    , ("Simon Peyton Jones: A Taste of Haskell - Part 1", "jLj1QV11o9g")
    , ("Simon Peyton Jones: A Taste of Haskell - Part 2", "EP0UgtZ9EDQ")
    ]
