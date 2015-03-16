import Ray.Types

dotProduct :: Vector -> Vector -> Double
dotProduct a b = a^.x * b^.x + a^.y * b^.y + a^.z * b^.z

normSquared :: Vector -> Double
normSquared v = dotProduct v v

norm :: Vector -> Double
norm v = sqrt $ dotProduct v v

