
### From :convert matrix to sparse

~~~q
	x: (0 1.1 0; 2.1 0 3.1)
                                    &:'~0=x /column of non zero element at each row
	(,1;0 2)
                       (!#:x)(,/:)' &:'~0=x /add row index
	(,0 1;(1 0;1 2))
                    ,/ (!#:x)(,/:)' &:'~0=x /flat
	(0 1;1 0;1 2)
          x ./:idx: ,/ (!#:x)(,/:)' &:'~0=x /get the value
	1.1 2.1 3.1
(+:idx),, x ./:idx: ,/ (!#:x)(,/:)' &:'~0=x /tuple of (row ; col; val)
	(0 1 1;1 0 2;1.1 2.1 3.1)

~~~

### fdd :apply function f on 2 dictionaries

~~~q
	x:(+); y:1 2!2 4; z:1 3!3 9
            .q.inter[!y;!z] /find common key of dictionary y an z
	,1
x[y k;]z k: .q.inter[!y;!z] /apply binary function x on value of common keys
	,5

~~~

### ddv :convert sparse matrix to (row; col!val) format

~~~q
	x:(0 1 1;2 3 4; `a`b`c)
                =:x 0 /group by row
	0 1!(,0;1 2)
      x[1 2]@\: =:x 0 /get col and val by row
	(0 1!(,2;3 4);0 1!(,`a;`b`c))
(!'/) x[1 2]@\: =:x 0 /change to col!val
	0 1!((,2)!,`a;3 4!`b`c)

~~~

### smm :Multiply sparse matrix

~~~q
	x:From x0:(1 0 0f;1 0 1f); y: From y0: (1 0 0 0f;0 0 2 1f;0 0 0 0f); r:x0$y0
                                   Trans y /transpose sparse matrix y
	(0 2 3;0 1 1;1 2 1f)
                               ddv Trans y /convert to dict->dict->val of row!col!val
	0 2 3!((,0)!,1f;(,1)!,2f;(,1)!,1f)
                 ddv[x]dXd/:\: ddv Trans y /outer product * of dictionary
	0 1!(0 2 3!(,1f;`float$();`float$());0 2 3!(,1f;`float$();`float$()))
            +/'' ddv[x]dXd/:\: ddv Trans y /sum vals
	0 1!(0 2 3!1 0 0f;0 2 3!1 0 0f)
     unddv@ +/'' ddv[x]dXd/:\: ddv Trans y /from ddv to sparse matrix
	(0 0 0 1 1 1;0 2 3 0 2 3;1 0 0 1 0 0f)
del0 unddv@ +/'' ddv[x]dXd/:\: ddv Trans y /remove if value is 0
	(0 1;0 0;1 1f)

~~~
