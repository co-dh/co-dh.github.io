From:{ /convert matrix to sparse 
    / x: (0 1.1 0; 2.1 0 3.1)
    (flip idx),enlist       / tuple of (row ; col; val)
    x ./:idx:               / get the value
    raze                    / flat
    (til count x)(,/:)'     / add row index
    where each 0<>x         / column of non zero element at each row"]
    }

Trans:{ /Transpose a sparse matrix represent as (row; col; val)
    / x: (0 1;2 3; 2.1 3.1)
    x[1 0 2]                / to (col; row; val)
    }
    
fdd:{[f;g;d;e]    /map function g on 2 dictionaries, then reduce with f
    / f:(+); g:(*); d:1 2!2 4; e:1 3!3 9
    (f/)                    / reduce with f
    g[d k;]e k:             / apply binary function x on value of common keys
    inter[key d;key e]      / find common key of dictionary y an z
    }

dXd:{ /map * to dictionaries d and e, then reduce with sum
    / f:(+); g:(*); d:1 2!2 4; e:1 3!3 9
    fdd[+;*;x;y]
    }
    
ddv:{ /convert sparse matrix to (row; col!val) format
    / x:(0 1 1;2 3 4; `a`b`c)
    (!'/)                   / change to col!val
    x[1 2]@\:               / get col and val by row
    group x 0               / group by row;
    } 

del0:{((key x)@where 0<>value x)#x}
unddv:{flip raze unk@unk each x}
unk: {(key x),/:'value x}

smm:{ /Multiply sparse matrix repersented by (row; col; val)
    /x:From x0:(5 0 0f;6 0 7f); y: From y0: (8 0 0 0f;0 0 9 7f;0 0 0 0f); r:x0$y0
     unddv@                 / from ddv to sparse matrix
     del0 each              / remove (k,v) from dictionary if v is 0
     ddv[x](dXd/:)\:        / outer product * of dictionary
     ddv                    / convert to dict->dict->val of row!col!val
     Trans y                / transpose sparse matrix y"];
     }

assert:{if[not x;'`Assert]}
x:From x0:(5 0 0f;6 0 7f); y: From y0: (8 0 0 0f;0 0 9 7f;0 0 0 0f); r:x0$y0
assert smm[x;y]~From x0$y0
