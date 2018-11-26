import ListHalve
import TreeDef

initialize f [] = Empty
initialize f [x] = Node x 1 f Empty Empty
initialize f xs = Node ( f ( getRoot t1 ) ( getRoot t2 ) ) ( cntLeaves t1 + cntLeaves t2 ) f t1 t2
    where
        ( fst_half_xs, snd_half_xs ) = halve xs
        t1 = initialize f fst_half_xs
        t2 = initialize f snd_half_xs

range_query tree range =
    let
        n = cntLeaves tree
        f = getOp tree
        ( l, r ) = range
        aux_query tree ( l', r' ) ( i, j ) =
            if i == l' && j == r' then getRoot tree
            else if j <= mid then aux_query ( getLeft tree ) ( l', mid ) ( i, j )
            else if i > mid then aux_query ( getRight tree ) ( mid + 1, r' ) ( i, j )
            else f t1 t2
                where
                    mid = div ( l' + r' )  2
                    t1 = aux_query ( getLeft tree ) ( l', mid ) ( i, mid )
                    t2 = aux_query ( getRight tree ) ( mid + 1, r' ) ( mid + 1, j )
    in
        aux_query tree ( 0, n - 1 ) ( l, r )
