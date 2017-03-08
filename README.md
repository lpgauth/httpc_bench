# httpc bench

#### How-to

##### Starting  server:

```
./bin/server.sh
Server started...
```

##### Running benchmarks:

```
./bin/run.sh
Running benchmark...

Client  PoolSize  Concurency  Requests/s  Error %
=================================================
buoy          64          32      141124      0.0
buoy          64          64      182302      0.0
buoy          64         128      257045      0.0
buoy          64         512      537231      0.0
buoy          64        2048      580681      0.0
dlhttpc       64          32       55283      0.0
dlhttpc       64          64       60334     68.8
dlhttpc       64         128       44304     77.7
dlhttpc       64         512       24932     88.1
dlhttpc       64        2048       15224     93.0
hackney       64          32       22065      0.0
hackney       64          64       19797      0.0
hackney       64         128       26225      0.0
hackney       64         512       23516      0.0
hackney       64        2048       21347      0.0
httpc         64          32       11521      0.0
httpc         64          64       11706      0.0
httpc         64         128       10810      0.0
httpc         64         512       10821      0.0
httpc         64        2048        9890      0.0
ibrowse       64          32       29347      0.0
ibrowse       64          64       29367      0.0
ibrowse       64         128       29322      0.0
ibrowse       64         512       26417      0.0
ibrowse       64        2048       25097      0.0
katipo        64          32       76736      0.0
katipo        64          64       47199      0.0
katipo        64         128       43950      0.0
katipo        64         512       45768      0.0
katipo        64        2048       46969      0.0
```
