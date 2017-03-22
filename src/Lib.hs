{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( cubeRenderer
    ) where

import SDL.Pal
import Graphics.GL.Pal
import Halive.Utils
import Halive
import Control.Monad.Reader
import Control.Exception
import Data.Time

import qualified Data.Vector.Storable.Mutable as VM

data Uniforms = Uniforms
    { uProjectionView :: UniformLocation (M44 GLfloat)
    } deriving Data

numInstances :: Num a => a
numInstances = 10000


cubeRenderer :: IO ()
cubeRenderer = do
    win <- reacquire 0 $ createGLWindow "Geometry Test"

    shader        <- createShaderProgram "res/geoInstancedM44.vert" "res/geoInstancedM44.frag"

    cubeGeo       <- cubeGeometry 0.5 1
    cubeShape     <- makeShape cubeGeo shader

    ghc <- startGHCDefault

    getCompiledCubes <- liveExpression ghc "tut/cubes.hs" "cubes"
        (\(t::GLfloat) -> [])

    -- Create buffers for our data
    transformsVector <- VM.replicate numInstances (identity :: M44 GLfloat)
    colorsVector     <- VM.replicate numInstances (V4 0 0 0 0 :: V4 GLfloat)
    transformsBuffer <- bufferDataV GL_DYNAMIC_DRAW transformsVector
    colorsBuffer     <- bufferDataV GL_DYNAMIC_DRAW colorsVector

    withShape cubeShape $ do
        withArrayBuffer transformsBuffer $
            assignMatrixAttributeInstanced shader "aInstanceTransform" GL_FLOAT
        withArrayBuffer colorsBuffer $
            assignFloatAttributeInstanced  shader "aInstanceColor" GL_FLOAT 4
    glEnable GL_DEPTH_TEST
    glClearColor 0.0 0.0 0.1 1

    whileWindow win $ \_events -> do

        projection <- getWindowProjection win 45 0.1 1000
        (x,y,w,h)  <- getWindowViewport win
        glViewport x y w h

        glClear (GL_COLOR_BUFFER_BIT .|. GL_DEPTH_BUFFER_BIT)

        let view = viewMatrix (V3 0 0 100) (axisAngle (V3 0 1 0) 0)

        t <- (*10) . realToFrac . utctDayTime <$> getCurrentTime

        -- Fill buffers with newest data
        generateCubes <- getCompiledCubes
        let cubes = generateCubes t
        count <- foldM (\_acc (i, (transform, color)) -> do
            VM.write transformsVector i transform
            VM.write colorsVector     i color
            return i) 0 (zip [0..numInstances-1] cubes)
            `catch` (\(e :: SomeException) -> print e >> return 0)
        bufferSubDataV transformsBuffer transformsVector
        bufferSubDataV colorsBuffer     colorsVector

        withShape cubeShape $ do
            Uniforms{..} <- asks sUniforms
            uniformM44 uProjectionView (projection !*! view)
            drawShapeInstanced (fromIntegral count)

        glSwapWindow win

