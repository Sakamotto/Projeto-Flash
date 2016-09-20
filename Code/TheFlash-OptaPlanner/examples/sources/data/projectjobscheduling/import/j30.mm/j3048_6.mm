************************************************************************
file with basedata            : mf48_.bas
initial value random generator: 2082059722
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  32
horizon                       :  242
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  2   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     30      0       31        2       31
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        3          3           6  18  26
   3        3          3           5  13  21
   4        3          3           7   8   9
   5        3          2          10  24
   6        3          1          29
   7        3          1          15
   8        3          2          12  20
   9        3          3          11  16  21
  10        3          2          17  31
  11        3          2          18  23
  12        3          3          14  16  22
  13        3          3          15  17  23
  14        3          2          19  24
  15        3          1          27
  16        3          1          17
  17        3          1          19
  18        3          2          22  28
  19        3          2          26  27
  20        3          1          26
  21        3          2          23  24
  22        3          2          25  30
  23        3          2          25  27
  24        3          2          28  31
  25        3          1          31
  26        3          2          29  30
  27        3          1          28
  28        3          2          29  30
  29        3          1          32
  30        3          1          32
  31        3          1          32
  32        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  N 1  N 2
------------------------------------------------------------------------
  1      1     0       0    0    0    0
  2      1     1       6    7    7   10
         2     7       6    7    5   10
         3     9       5    6    4    9
  3      1     3       5    6    4   10
         2     6       5    4    4   10
         3     9       4    2    2   10
  4      1     1       6   10    4    9
         2     3       6    6    4    8
         3     5       6    2    3    8
  5      1     5       4   10    4    8
         2     6       4    7    4    5
         3    10       3    7    3    5
  6      1     2       3    7    6    7
         2     6       3    5    3    6
         3     9       2    4    3    4
  7      1     2       2    7    5    4
         2     3       2    7    5    3
         3     9       2    6    4    2
  8      1     1       6    9    7    8
         2     3       4    8    7    4
         3     7       3    4    6    1
  9      1     1       5    8    6    5
         2     7       4    8    6    4
         3     8       4    7    5    4
 10      1     3       8    7    2    2
         2     5       7    5    2    2
         3     8       4    1    2    2
 11      1     3       8    3    5    9
         2     4       5    3    3    6
         3     7       2    3    2    6
 12      1     2       6    7    7    3
         2     6       4    5    6    3
         3    10       2    4    3    2
 13      1     3       8    6    7    8
         2     5       7    5    6    4
         3     9       7    5    4    3
 14      1     3       9    8    4    8
         2     5       7    6    4    5
         3     5       8    6    3    5
 15      1    10       6    6    9    7
         2    10       6    6   10    6
         3    10       6    2    7    8
 16      1     5       8    5    7    9
         2     5       8    7    7    6
         3     8       8    2    5    3
 17      1     1       2    6    4    7
         2     8       2    5    4    6
         3     9       1    4    4    3
 18      1     1       8    8    7    8
         2     3       8    6    7    8
         3    10       7    4    6    6
 19      1     1       8    5    9    7
         2     2       7    5    9    7
         3     3       6    5    8    4
 20      1     1       7    8    7    7
         2     1       6    7    8    7
         3     5       5    6    4    6
 21      1     1       8    9    5    4
         2     7       6    9    5    3
         3     8       4    8    5    3
 22      1     2       6    9    8    8
         2     7       5    6    8    5
         3     9       4    3    6    5
 23      1     5       9    9    5    7
         2     8       8    6    3    4
         3     9       8    5    1    3
 24      1     1       7    4    8    9
         2     6       5    3    7    5
         3     9       3    2    7    4
 25      1     1       1   10    6    6
         2     2       1    9    6    3
         3     9       1    9    3    3
 26      1     6       5    5   10   10
         2     7       4    5    8    7
         3     8       4    5    8    2
 27      1     1       2    8    5    6
         2     7       1    7    1    6
         3     7       1    5    4    5
 28      1     8       5    4    5    8
         2     9       4    4    4    6
         3    10       3    4    2    2
 29      1     6       9    8    8    4
         2     6       9    7    8    6
         3     9       8    5    8    1
 30      1     1       5    7    8    4
         2     7       1    2    8    2
         3     7       2    3    7    4
 31      1     2       9   10    4    6
         2     6       9    4    4    5
         3     7       8    2    4    4
 32      1     0       0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  N 1  N 2
   42   49  158  167
************************************************************************
