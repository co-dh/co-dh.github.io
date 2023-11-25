fdd:{k:(!y).q.inter!z;x[y k;z k]}; dXd:fdd[*];    ftt:{(y 0;z 0;x dXd[y 1;z 1])};    tXt:ftt[+/];    Trans:{x 1 0 2} 
Rcdv:{(!d),',' .:d:((!/)+:@)'=:(+:x 1 2)!x 0};    smm:{flip raze Rcdv[Sparse x] tXt/:\:Rcdv[Trans Sparse y]}
From:{(+:idx),,x ./:idx:,/(!#:x)(,/:)'&:'~0=x}

k)dedent:{d:&/+/'&\'" "=x:x@&~.q.trim[x]like ""; d _/:x}; ralign:{(-:|/#:'x)$/:x}
k)fmt:{[n;com;w;x]-1@"\n"/:(,"\n### ",($n)," :",com),(,"\n~~~q\n\t",w),x,(,"\n~~~\n");}
k)ex:{[w;x].:w; tc:.q.trim'|:'+(" /"\:)'dedent@"\n"\:x;   :({x," /",y,"\n\t",z}'[t;tc 1]) r:-3!' .:'"k)",/:t:ralign({y,x}\)tc[0]}
k)explain:{[n;com;with;x] fmt[n;com;with;]ex[with;x]}
explain[`From; "convert matrix to sparse";  "x: (0 1.1 0; 2.1 0 3.1)"]"
    (+:idx),,                   /tuple of (row ; col; val)
    x ./:idx:                   /get the value
    ,/                          /flat
    (!#:x)(,/:)'                /add row index
    &:'~0=x                    /column of non zero element at each row
    "
    
explain[`fdd; "apply function f on 2 dictionaries"; "x:(+); y:1 2!2 4; z:1 3!3 9"] " 
    x[y k;]z k:                      /apply binary function x on value of common keys
    .q.inter[!y;!z]              /find common key of dictionary y an z
    "
    
explain[`Rcdv; "convert sparse matrix to (row; col!val) format" ; "x:(0 1 1;2 3 4; `a`b`c)"]"
    (!d),'          / ((row; col!val))
    ,:'             /enlist each. ((col!val))
    .:d:            /value
    (!/+:)'         /col!val by row
    =:              /group by row 
    (+:x 1 2)!x 0   /col, val ! row
    "
    
smm:{flip raze Rcdv[Sparse x] tXt/:\:Rcdv[Trans Sparse y]}
