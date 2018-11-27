module TreeDef where

data Tree dt = Empty | Node dt Int ( dt->dt->dt ) ( Tree dt ) ( Tree dt )

getRoot ( Node r _ _ _ _ ) = r
cntLeaves ( Node _ lvs _ _ _ ) = lvs
getOp ( Node _ _ f _ _ ) = f
getLeft ( Node _ _ _ left _ ) = left
getRight ( Node _ _ _ _ right ) = right
