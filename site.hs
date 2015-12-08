--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do

    match ("CNAME" .||.
           "favicon.png" .||.
           "images/**" .||.
           "js/**" .||.
           "simon/**" .||.
           "hotwire/**" .||.
           "fhnw/**" .||.
           "hausteil/**" .||.
           "audio/**" ) $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "posts/*" $ do
        route $ dateRoute
        compile $ pandocCompiler
            >>= saveSnapshot "content"
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= removeIndexHtmlFromUrls

    create ["index.html"] $ do
            route idRoute
            compile $ do
                posts <- recentFirst =<< loadAllSnapshots "posts/**" "content"
                let indexCtx = listField "posts" postCtx (return (take 3 posts))

                makeItem ""
                    >>= loadAndApplyTemplate "templates/index.html" indexCtx
                    >>= loadAndApplyTemplate "templates/default.html" defaultContext
                    >>= removeIndexHtmlFromUrls

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Archives"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= removeIndexHtmlFromUrls

    create ["about.html"] $ do
        route idRoute
        compile $ do
            makeItem ""
                >>= loadAndApplyTemplate "templates/about.html" defaultContext
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= removeIndexHtmlFromUrls

    match "templates/*" $ compile templateCompiler

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext
--------------------------------------------------------------------------------
-- turns index.html links into just the directory name
removeIndexHtmlFromUrls :: Item String -> Compiler (Item String)
removeIndexHtmlFromUrls item = do
    route <- getRoute $ itemIdentifier item
    return $ case route of
        Nothing -> item
        Just r  -> fmap removeIndexHtmlFromUrlsWith item

removeIndexHtmlFromUrlsWith :: String -> String
removeIndexHtmlFromUrlsWith = withUrls convert
  where
    convert x = replaceAll "/index.html" (const "/") x
--------------------------------------------------------------------------------
-- routes posts/2011-12-31-foo.markdown to blog/2011/12/31/foo/index.html
dateRoute :: Routes
dateRoute =
    gsubRoute "posts/" (const "blog/") `composeRoutes`
        gsubRoute "blog/[0-9]{4}-[0-9]{2}-[0-9]{2}-" (map replaceWithSlash) `composeRoutes`
            gsubRoute ".markdown" (const "/index.html")
    where replaceWithSlash c = if c == '-' || c == '_'
                               then '/'
                               else c