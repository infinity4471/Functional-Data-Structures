module TreeDef where

--Definition of binary search tree for arbitrary data types associated with a function
--f :: dt->dt->dt for merging subtrees
data Tree dt = Empty | Node dt Int (dt->dt->dt) ( Tree dt ) ( Tree dt )

getRoot ( Node root _ _ _ _ ) = root
cntLeaves ( Node _ lvs _ _ _ ) = lvs
getOp ( Node _ _ f _ _ ) = f
getLeft ( Node _ _ _ left _ ) = left
getRight ( Node _ _ _ _ right ) = right
