-module(httpc_bench_buoy).
-include("httpc_bench.hrl").
-include_lib("buoy/include/buoy.hrl").

-export([
    get/0,
    start/1,
    stop/0
]).

%% public
get() ->
    case buoy:get(?BUOY_URL, #{timeout => ?TIMEOUT}) of
        {ok, _} ->
            ok;
        {error, Reason} ->
            {error, Reason}
    end.

start(PoolSize) ->
    {ok, _} = buoy_app:start(),
    Options = [
        {backlog_size, ?PIPELINING},
        {pool_size, PoolSize}
    ],
    ok = buoy_pool:start(?BUOY_URL, Options).

stop() ->
    ok = buoy_pool:stop(?BUOY_URL).
