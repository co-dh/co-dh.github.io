
### From
convert matrix to sparse
~~~q
    x: (0 1.1 0; 2.1 0 3.1)Code           Result                      Comment                                 
    -----------------------------------------------------------------------------------
    &:'~0=x      (,1;0 2)                  column of non zero element at each row
    (!#:x)(,/:)' (,0 1;(1 0;1 2))          add row index                         
    ,/           (0 1;1 0;1 2)             flat                                  
    x ./:idx:    1.1 2.1 3.1               get the value                         
    (+:idx),,    (0 1 1;1 0 2;1.1 2.1 3.1) tuple of (row ; col; val)             
    
~~~

### fdd
apply function f on 2 dictionaries
~~~q
    x:(+); y:1 2!2 4; z:1 3!3 9Code              Result Comment                                          
    --------------------------------------------------------------------------
    .q.inter[!y;!z] ,1   find common key of dictionary y an z           
    x[y k;]z k:     ,5   apply binary function x on value of common keys
    
~~~

### ddv
convert sparse matrix to (row; col!val) format
~~~q
    x:(0 1 1;2 3 4; `a`b`c)Code         Result                          Comment                 
    ---------------------------------------------------------------------
    =:x 0      0 1!(,0;1 2)                  group by row          
    x[1 2]@\\: (0 1!(,2;3 4);0 1!(,`a;`b`c)) get col and val by row
    (!'/)      0 1!((,2)!,`a;3 4!`b`c)       change to col!val     
    
~~~
