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

update tree upd =
    let
        n = cntLeaves tree
        f = getOp tree
        ( idx, val ) = upd
        aux_update tree l r =
            if l == r then
                Node val 1 f Empty Empty
            else if idx <= mid then
                let
                    t1 = aux_update ( getLeft tree ) l mid
                    lroot = getRoot t1
                in
                    Node ( f lroot ( getRoot ( getRight tree ) ) ) ( cntLeaves tree ) f t1 ( getRight tree )
            else
                let
                    t2 = aux_update ( getRight tree ) ( mid + 1 ) r
                    rroot = getRoot t2
                in
                    Node ( f ( getRoot ( getLeft tree ) ) rroot ) ( cntLeaves tree ) f ( getLeft tree ) t2
            where
                mid = div ( l + r ) 2
    in
        aux_update tree 0 ( n - 1 )

get_values ( Node x _ _ Empty Empty ) = [ x ]
get_values tree = ( get_values t1 ) ++ ( get_values t2 )
    where
        t1 = getLeft tree
        t2 = getRight tree
