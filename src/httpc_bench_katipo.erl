% https://github.com/puzza007/katipo

-module(httpc_bench_katipo).
-include("httpc_bench.hrl").

-export([
    get/0,
    start/1,
    stop/0
]).

%% public
get() ->
    {ok, _} = katipo:get(httpc_bench, ?URL, #{}),
    ok.

% NOTE: Opens arbitrary number of TCP connections
% https://github.com/puzza007/katipo/issues/50

start(PoolSize) ->
    {ok, _} = application:ensure_all_started(katipo),
    KatipoOpts = [
        {pipelining, true},
        {max_pipeline_length, ?PIPELINING}
    ],
    {ok, _} = katipo_pool:start(httpc_bench, PoolSize, KatipoOpts).

stop() ->
    ok = application:stop(katipo),
    ok = application:stop(gproc).
