fdd:{k:.q.inter[!y;!z];x[y k;z k]}; dXd:fdd[*];    ftt:{(y 0;z 0;x dXd[y 1;z 1])};    tXt:ftt[+/];  Trans:{x 1 0 2} 
Rcdv:{(!d),',:' .:d:(!/+:)'=:(+:x 1 2)!x 0};    smm:{flip raze Rcdv[From x] tXt/:\:Rcdv[Trans From y]}
From:{(+:idx),,x ./:idx:,/(!#:x)(,/:)'&:'~0=x}

\l explain.k
explain[`From; "convert matrix to sparse";  "x: (0 1.1 0; 2.1 0 3.1)"]"
    (+:idx),,                   /tuple of (row ; col; val)
    x ./:idx:                   /get the value
    ,/                          /flat
    (!#:x)(,/:)'                /add row index
    &:'~0=x                    /column of non zero element at each row"
explain[`fdd; "apply function f on 2 dictionaries"; "x:(+); y:1 2!2 4; z:1 3!3 9"]" 
    x[y k;]z k:                      /apply binary function x on value of common keys
    .q.inter[!y;!z]              /find common key of dictionary y an z"
explain[`Rcdv; "convert sparse matrix to (row; col!val) format" ; "x:(0 1 1;2 3 4; `a`b`c)"]"
    (!d),'          / ((row; col!val))
    ,:'             /enlist each. ((col!val))
    .:d:            /value
    (!/+:)'         /col!val by row
    =:              /group by row 
    (+:x 1 2)!x 0   /col, val ! row";
    
explain[`Smm; "Multiply sparse matrix"; "x:From x0:(1 0 0f;1 0 1f); y: From y0: (1 0 0 0f;0 0 2 1f;0 0 0 0f); r:x0$y0";]"
    assert From[r]~ /verify the result against normal matrix multiplication
    t@\\:           /take only non 0 value
    &:~0=           /where not val = 0
    @[;2]t:         /save to t, at take val
    +:              /flip to get (row; col; val)
    ,/              /raze to flat
    Rcdv[x]tXt/:\\: /outer product with x. 
    Rcdv            /convert to ((row; col!val))
    Trans           /transpose y
    y               /sparse matrix represented as (row; col; val)" ;
    
\\
/
tree diameter problem.

    
