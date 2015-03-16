{-# LANGUAGE TemplateHaskell #-}

import Control.Lens

data Color = Color {
    _r :: Double,
    _g :: Double
    _b :: Double
} deriving Show

makeLenses ''Color

data Material = Material {
    _color :: Color
} deriving Show

makeLenses ''Material

data Vector = Vector {
    _x::Double,
    _y::Double,
    _z::Double
} deriving Show

makeLenses ''Vector

data Ray = Ray {
    _origin :: Vector,
    _direction :: Vector
} deriving Show

makeLenses ''Ray

data Plane = Plane {

} deriving Show

makeLenses ''Plane

data Sphere = Sphere {
    _origin :: Vector,
    _radius :: Double
} deriving Show

makeLenses ''Sphere

data Intersection = Intersection {
    _point :: Vector,
    _color :: Color
}

makeLenses ''Intersection

class Visible a where
    intersect :: Ray -> a -> Maybe Intersection

