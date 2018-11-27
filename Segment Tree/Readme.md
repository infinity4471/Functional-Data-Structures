## Segment Tree

This is a purely functional implementation of a generic segment tree. It can store and perform operations on arbitrary
groups of numbers since it can be parameterized with a merging function (f) that works as the group operation.

Currently supported operations:

1. initialize :: ( dt->dt->dt ) -> [ dt ] -> ( Tree dt ). Given a binary operation and a list of data, it builds and returns the segment tree that is produced.
  
2. range_query :: ( Tree dt ) -> ( Int, Int ) -> dt. Given the root of a segment tree and a range, it performs a query on the given tree and returns the result. Time complexity: O( logn * T( f ) ) where T( f ) the time it takes to compute the function f associated with the tree.
  
3. update :: ( Tree dt ) -> ( Int, dt ) -> ( Tree dt ). Given the root of a segment tree, an index and a value it changes the previous value at that index to the new one and returns the new tree. Time complexity: O( logn * T( f ) ) with additional space O( logn ) per operation.
  
4. get_values :: ( Tree dt ) -> [ dt ]. Performs inorder traversal of the tree and returns the values at the leaves. Time complexity: O( n ).
