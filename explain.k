    extract code, load it, then explain by execute line by line, and save the result in Markdown.
    The explain step should output a markdown table of func|result|comment.
    It also extract the k code into a .k file.
    
dedent:{d:&/+/'&\'" "=x:x@&~.q.trim[x]like ""; d _/:x}; ralign:{(-:|/#:'x)$/:x}
head: "\n"/:(,," "),dedent@"\n"\:"
    | Func | Result | Comment |
    | ---  | ---    | ---     |"
fmt:{[n;com;w;x]-1@"\n"/:(,"\n### ",($n)," :",com),(,w,head),x,(,,"\n");}
txtCom:{.q.trim'+(" /"\:)'dedent@"\n"\:x} /txt and comment 
ex:{[w;x].:w; tc: |:' txtCom x;   :({"|"/:("";x;z;y;"")}'[tc 0;tc 1]) r:-3!' .:'"k)",/:t:ralign({y," ",x}\)tc[0]}
explain:{[n;com;with;x] fmt[n;com;with;]ex[with;x]}
/explain:{[n;com;with;x]-1@,[;"}"] "\n",($n),": {"," "/:*:txtCom x;}
assert:{if[~x; '`Assert];x}
\c 15 500
