************************************************************************
file with basedata            : mm35_.bas
initial value random generator: 255953301
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  12
horizon                       :  80
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  2   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     10      0       13        4       13
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        3          1           5
   3        3          3           8   9  10
   4        3          2           6   7
   5        3          3           6  10  11
   6        3          1           9
   7        3          1           8
   8        3          1          11
   9        3          1          12
  10        3          1          12
  11        3          1          12
  12        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  N 1  N 2
------------------------------------------------------------------------
  1      1     0       0    0    0    0
  2      1     2       9   10    0    9
         2     3       9    6    6    0
         3     5       9    5    5    0
  3      1     1      10    9    7    0
         2     4      10    8    0    5
         3     9      10    7    0    3
  4      1     1       7    9    5    0
         2     2       6    8    0    3
         3     4       6    7    0    2
  5      1     3       9    7    9    0
         2     4       7    4    6    0
         3     8       4    3    4    0
  6      1     1       8    7    9    0
         2     2       6    5    7    0
         3     9       6    2    6    0
  7      1     3       6    6    0   10
         2     6       6    5    5    0
         3    10       5    5    0    4
  8      1     1       9    6    1    0
         2     3       7    6    0    6
         3    10       6    5    0    6
  9      1     7       4    5    0    5
         2     8       4    5    0    4
         3     8       4    4    8    0
 10      1     2       6    7    0    9
         2     3       4    7    4    0
         3     8       4    4    0    7
 11      1     7      10    4    8    0
         2     8       9    4    7    0
         3     9       9    3    0    7
 12      1     0       0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  N 1  N 2
   13   11   46   38
************************************************************************
