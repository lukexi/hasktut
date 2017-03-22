import Linear.Extra
import Graphics.GL.Pal

cubes :: GLfloat -> [(M44 GLfloat, V4 GLfloat)]
cubes t = do
    i <- [0..1000]
    let x = fromIntegral $ (i `div` 100) - 50 :: GLfloat
        y = fromIntegral $ (i `mod` 100) - 50 :: GLfloat
        m44 = mkTransformation
                (axisAngle (V3 1 1 0) 1)
                (V3 (x+10) (y + sin (t + fromIntegral i)) 0)
                !*! scaleMatrix 3
        color = colorHSL hue 0.9 0.6
        hue = fromIntegral i / 1000 + sin (t/5)

    return (m44, color)
