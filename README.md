# httpc bench
Erlang HTTP client benchmarking suite

## How-to
#### Starting  server:

```
./bin/server.sh
Server started...
```

#### Running benchmark:

```
./bin/run.sh
Running benchmark...
```

## Benchmarks

#### Methodology

Benchmarks were executed on two servers, one client and one server.

- 2 x 48 Xeon cores @ 2.20GHz + 256 GB ram + SSDs
- Latency between the two servers < 0.1 ms
- Erlang 19.2.1

#### Results

```
Client  PoolSize  Concurency  Requests/s  Error %
=================================================
buoy           8          32      119826      0.0
buoy           8          64      186194      0.0
buoy           8         128      331073      0.0
buoy           8         512      341541      0.0
buoy           8        2048      209898      1.0
buoy           8        4096      218127      4.8
buoy          16          32      125243      0.0
buoy          16          64      200209      0.0
buoy          16         128      352494      0.0
buoy          16         512      718733      0.0
buoy          16        2048      388013      0.9
buoy          16        4096      365529      1.7
buoy          32          32      122525      0.0
buoy          32          64      193189      0.0
buoy          32         128      318713      0.0
buoy          32         512      857231      0.0
buoy          32        2048      632805      0.6
buoy          32        4096      590763      1.7
buoy          64          32      129109      0.0
buoy          64          64      175840      0.0
buoy          64         128      254174      0.0
buoy          64         512      718346      0.0
buoy          64        2048     1044965      0.0
buoy          64        4096      973609      1.0
buoy         128          32      127520      0.0
buoy         128          64      166182      0.0
buoy         128         128      225290      0.0
buoy         128         512      463867      0.0
buoy         128        2048     1013447      0.0
buoy         128        4096     1069773      0.0
buoy         256          32      129234      0.0
buoy         256          64      162817      0.0
buoy         256         128      209603      0.0
buoy         256         512      298300      0.0
buoy         256        2048      851399      0.0
buoy         256        4096     1059819      0.0
dlhttpc        8          32       19586     90.9
dlhttpc        8          64       12100     94.8
dlhttpc        8         128        8058     96.8
dlhttpc        8         512        2859     98.8
dlhttpc        8        2048         752     99.7
dlhttpc        8        4096         424     99.8
dlhttpc       16          32       37658     77.8
dlhttpc       16          64       24821     88.6
dlhttpc       16         128       14248     93.5
dlhttpc       16         512        5072     97.8
dlhttpc       16        2048        1453     99.4
dlhttpc       16        4096        1079     99.5
dlhttpc       32          32       54556     49.6
dlhttpc       32          64       47221     82.2
dlhttpc       32         128       28468     86.8
dlhttpc       32         512       10364     95.5
dlhttpc       32        2048        4198     98.2
dlhttpc       32        4096        1776     99.3
dlhttpc       64          32       64276      0.0
dlhttpc       64          64       73068     58.0
dlhttpc       64         128       53261     78.6
dlhttpc       64         512       18615     91.7
dlhttpc       64        2048        5566     97.6
dlhttpc       64        4096        4310     98.2
dlhttpc      128          32       64222      0.0
dlhttpc      128          64       81752      0.1
dlhttpc      128         128       88833     64.0
dlhttpc      128         512       39450     81.8
dlhttpc      128        2048       15848     93.0
dlhttpc      128        4096        7388     96.8
dlhttpc      256          32       62939      0.0
dlhttpc      256          64       80095      0.0
dlhttpc      256         128       93178      0.2
dlhttpc      256         512       85240     71.0
dlhttpc      256        2048       18489     91.7
dlhttpc      256        4096       13573     94.0
hackney        8          32       21939      0.0
hackney        8          64       21567      0.0
hackney        8         128       21419      0.0
hackney        8         512       22577      0.0
hackney        8        2048       22033      0.0
hackney        8        4096       23061      0.0
hackney       16          32       37085      0.0
hackney       16          64       38795      0.0
hackney       16         128       38606      0.0
hackney       16         512       38721      0.0
hackney       16        2048       37977      0.0
hackney       16        4096       36915      0.0
hackney       32          32       24108      0.0
hackney       32          64       35456      0.0
hackney       32         128       34723      0.0
hackney       32         512       32897      0.0
hackney       32        2048       32439      0.0
hackney       32        4096       33144      0.0
hackney       64          32       24273      0.0
hackney       64          64       21217      0.0
hackney       64         128       28438      0.0
hackney       64         512       27976      0.0
hackney       64        2048       26185      0.0
hackney       64        4096       26419      0.0
hackney      128          32       24308      0.0
hackney      128          64       21189      0.0
hackney      128         128       17751      0.0
hackney      128         512       22017      0.0
hackney      128        2048       21547      0.0
hackney      128        4096       20482      0.0
hackney      256          32       23976      0.0
hackney      256          64       21227      0.0
hackney      256         128       17859      0.0
hackney      256         512       15659      0.0
hackney      256        2048       15386      0.0
hackney      256        4096       15007      0.0
httpc          8          32       10697      0.0
httpc          8          64       11190      0.0
httpc          8         128       10998      0.0
httpc          8         512       11522      0.0
httpc          8        2048       11498      0.0
httpc          8        4096       10594      0.0
httpc         16          32       11571      0.0
httpc         16          64       11150      0.0
httpc         16         128       11288      0.0
httpc         16         512       11095      0.0
httpc         16        2048       11163      0.0
httpc         16        4096       11142      0.0
httpc         32          32       11368      0.0
httpc         32          64       11367      0.0
httpc         32         128       11170      0.0
httpc         32         512       11821      0.0
httpc         32        2048       11616      0.0
httpc         32        4096       11090      0.0
httpc         64          32       11785      0.0
httpc         64          64       11737      0.0
httpc         64         128       11393      0.0
httpc         64         512       11360      0.0
httpc         64        2048       11233      0.0
httpc         64        4096       11100      0.0
httpc        128          32       11606      0.0
httpc        128          64       11636      0.0
httpc        128         128       11065      0.0
httpc        128         512       11346      0.0
httpc        128        2048       11258      0.0
httpc        128        4096       10301      0.0
httpc        256          32       11717      0.0
httpc        256          64       11333      0.0
httpc        256         128       11453      0.0
httpc        256         512       11532      0.0
httpc        256        2048        5691      0.0
httpc        256        4096       13707      0.0
ibrowse        8          32       41845      0.0
ibrowse        8          64       71028      0.0
ibrowse        8         128       72552      0.0
ibrowse        8         512       72211      0.0
ibrowse        8        2048       69884      0.0
ibrowse        8        4096       67963      0.0
ibrowse       16          32       47295      0.0
ibrowse       16          64       48366      0.0
ibrowse       16         128       46622      0.0
ibrowse       16         512       44920      0.0
ibrowse       16        2048       41558      0.0
ibrowse       16        4096       42641      0.0
ibrowse       32          32       39493      0.0
ibrowse       32          64       39279      0.0
ibrowse       32         128       38824      0.0
ibrowse       32         512       35935      0.0
ibrowse       32        2048       33300      0.0
ibrowse       32        4096       33858      0.0
ibrowse       64          32       31731      0.0
ibrowse       64          64       31934      0.0
ibrowse       64         128       31486      0.0
ibrowse       64         512       30234      0.0
ibrowse       64        2048       28227      0.0
ibrowse       64        4096       28896      0.0
ibrowse      128          32       24398      0.0
ibrowse      128          64       23929      0.0
ibrowse      128         128       23849      0.0
ibrowse      128         512       22704      0.0
ibrowse      128        2048       21853      0.0
ibrowse      128        4096       21759      0.0
ibrowse      256          32       16691      0.0
ibrowse      256          64       15802      0.0
ibrowse      256         128       15812      0.0
ibrowse      256         512       15857      0.0
ibrowse      256        2048       15920      0.0
ibrowse      256        4096       15692      0.0
katipo         8          32       91396      0.0
katipo         8          64      107900      0.0
katipo         8         128       69101      0.0
katipo         8         512       54399      0.0
katipo         8        2048       56377      0.0
katipo         8        4096       56577      0.0
katipo        16          32       83768      0.0
katipo        16          64       65297      0.0
katipo        16         128       56686      0.0
katipo        16         512       51078      0.0
katipo        16        2048       53921      0.0
katipo        16        4096       53943      0.0
katipo        32          32       63544      0.0
katipo        32          64       51159      0.0
katipo        32         128       47105      0.0
katipo        32         512       49193      0.0
katipo        32        2048       53267      0.0
katipo        32        4096       53363      0.0
katipo        64          32       55178      0.0
katipo        64          64       51926      0.0
katipo        64         128       46058      0.0
katipo        64         512       47370      0.0
katipo        64        2048       53081      0.0
katipo        64        4096       52890      0.0
katipo       128          32       76074      0.0
katipo       128          64       47678      0.0
katipo       128         128       45580      0.0
katipo       128         512       46820      0.0
katipo       128        2048       49405      0.0
katipo       128        4096       51228      0.0
katipo       256          32       82793      0.0
katipo       256          64       47563      0.0
katipo       256         128       44042      0.0
katipo       256         512       45413      0.0
katipo       256        2048       47326      0.0
katipo       256        4096       48530      0.0
```
