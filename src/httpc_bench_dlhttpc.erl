% https://github.com/lpgauth/dlhttpc

-module(httpc_bench_dlhttpc).
-include("httpc_bench.hrl").

-export([
    get/0,
    start/1,
    stop/0
]).

%% public
get() ->
    try dlhttpc:request(?URL, <<"GET">>, ?HEADERS, <<>>, ?TIMEOUT, []) of
        {ok, _} ->
            ok
    catch
        exit:{busy, _} ->
            {error, busy}
    end.

start(PoolSize) ->
    application:ensure_all_started(dlhttpc),
    % HACK: start dispcount pool
    Options = [{max_connections, PoolSize}],
    {ok, _} = dlhttpc:request(?URL, <<"GET">>, ?HEADERS, <<>>, ?TIMEOUT, Options),
    ok.

stop() ->
    ok = application:stop(dlhttpc),
    ok = application:stop(dispcount).
