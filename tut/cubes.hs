import Linear.Extra
import Graphics.GL.Pal

cubes :: GLfloat -> [(M44 GLfloat, V4 GLfloat)]
cubes t = do
    x <- (/10) <$> [-20..20]
    y <- (/10) <$> [-15..15]

    let position = V3 (x*25) (y*25 + sin (t*0.1+x)) 0
        rotation = axisAngle (V3 1 1 0) (t*0.1+x)
        scale = 3
        color = colorHSL hue 0.9 0.6
        hue = x+y+t*0.01

    return (mkTransformation
                rotation
                position
                !*!
                scaleMatrix scale, color)
