# Enumerate all partitions of an array

## Definition:

A partition P of a set x is a set of set where union of all Pi is x,

    unionOfPartitionIsTheSame: {distinct[asc x] ~ distinct asc raze Prt x}

and there is no intersection of any Pi, Pj.

    NoIntersection: {all 0 = count each (inter)/:\: Prt x}

## Terminology
For a set like 1 2 3 4, a partition of it like (1 2; 3 4), and we call 1 2 a **part** .

## Examples
~~~q
    0N! Prt enlist 1;
,,,1
    0N! Prt 1 2;
((,1;,2);,1 2)
    0N! Prt 1 2 3;
((,1;,2;,3);(1 2;,3);(1 3;,2);(,1;2 3);,1 2 3)
    show 3 5 # Prt 1 2 3 4
(,1;,2;,3;,4) (1 2;,3;,4) (1 3;,2;,4) (,1;2 3;,4) (1 2 3;,4)
(1 4;,2;,3)   (,1;2 4;,3) (,1;,2;3 4) (1 2 4;,3)  (1 2;3 4) 
(1 3 4;,2)    (1 3;2 4)   (1 4;2 3)   (,1;2 3 4)  ,1 2 3 4  
~~~

## How it works
* [Notation is important](../1meth/1notation.md)
* [Use pen and paper to get the idea firt](../1meth/2_prefer_pen_paper.md)
* Thought are not smooth before the term **part** was created.

From partitions of 1 to 1 2
<pre>
| Partition     | conversion            | Resutl       |
| ----------    | -----------           | -------      |
| [[1 ^]  ]     | append 2 to each part | [[1 2]     ] |
| [[1]   ^]     | 2 as a separated part | [[1  ] [2] ] |
</pre>
From partitions of 1 2 to 1 2 3
<pre>
| Partition         | conversion               | Resutl              |
| ----------        | -----------              | -------             |
| [[1 2  ] ^]       | append [3] as a new part | [[1 2  ] [3]]       |
| [[1 2 ^]  ]       | append 3 to first part   | [[1 2 3]    ]       |
| [[1  ] [2  ] ^]   | append [3] as a new part | [[1  ] [2  ] [3] ]  |
| [[1 ^] [2  ]  ]   | append 3 to 1st part     | [[1 3] [2  ]     ]  |
| [[1  ] [2 ^]  ]   | append 3 to 2nd part     | [[1  ] [2 3]     ]  |
</pre>

## Code loaded
~~~q
/x:a, y: [[a]]. append x to y[0], then to y[1], ..., raze the result.
appendEach:{ @[y; ;, ;x]each til count y}
Prt:{ /[a] -> [[[a]]]. return all partitions of array x.
    ; if[1=count x; : enlist enlist x]
    ; smaller: .z.s -1 _ x
    ; (smaller,\:enlist -1#x), raze appendEach[last x]each smaller
    }
~~~
