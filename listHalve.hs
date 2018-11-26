module ListHalve where

halve [] = ( [], [] )
halve [ a ] = ( [ a ], [] )
halve ls =
    let
        aux xs rest l1 l2 =
            if l1 <= l2 then ( reverse rest, xs )
            else
                let
                    h = head xs
                    t = tail xs
                in
                    aux t (h:rest) ( l1 - 1 )  ( l2 + 1 )
    in
        aux ls [] ( length ls ) 0
