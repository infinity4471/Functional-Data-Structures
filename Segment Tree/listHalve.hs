module ListHalve where

halve [] = ( [], [] )
halve [a] = ( [ a ], [] )
halve ls = aux_halve ls [] ( length ls ) 0
    where
        aux_halve xs rest l1 l2 =
            if l1 <= l2 then ( reverse rest, xs )
            else aux_halve ( tail xs ) ( ( head xs ) : rest ) ( l1 - 1 ) ( l2 + 1 )

