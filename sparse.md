
### From :convert matrix to sparse

~~~q
	x: (0 1.1 0; 2.1 0 3.1)
                                &:'~0=x /column of non zero element at each row
	(,1;0 2)
                    (!#:x)(,/:)'&:'~0=x /add row index
	(,0 1;(1 0;1 2))
                  ,/(!#:x)(,/:)'&:'~0=x /flat
	(0 1;1 0;1 2)
         x ./:idx:,/(!#:x)(,/:)'&:'~0=x /get the value
	1.1 2.1 3.1
(+:idx),,x ./:idx:,/(!#:x)(,/:)'&:'~0=x /tuple of (row ; col; val)
	(0 1 1;1 0 2;1.1 2.1 3.1)

~~~

### fdd :apply function f on 2 dictionaries

~~~q
	x:(+); y:1 2!2 4; z:1 3!3 9
           .q.inter[!y;!z] /find common key of dictionary y an z
	,1
x[y k;]z k:.q.inter[!y;!z] /apply binary function x on value of common keys
	,5

~~~

### Rcdv :convert sparse matrix to (row; col!val) format

~~~q
	x:(0 1 1;2 3 4; `a`b`c)
                      (+:x 1 2)!x 0 /col, val ! row
	((2;`a);(3;`b);(4;`c))!0 1 1
                    =:(+:x 1 2)!x 0 /group by row
	0 1!(,(2;`a);((3;`b);(4;`c)))
             (!/+:)'=:(+:x 1 2)!x 0 /col!val by row
	0 1!((,2)!,`a;3 4!`b`c)
         .:d:(!/+:)'=:(+:x 1 2)!x 0 /value
	((,2)!,`a;3 4!`b`c)
      ,:'.:d:(!/+:)'=:(+:x 1 2)!x 0 /enlist each. ((col!val))
	(,(,2)!,`a;,3 4!`b`c)
(!d),',:'.:d:(!/+:)'=:(+:x 1 2)!x 0 /((row; col!val))
	((0;(,2)!,`a);(1;3 4!`b`c))

~~~
