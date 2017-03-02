% https://github.com/benoitc/hackney

-module(httpc_bench_hackney).
-include("httpc_bench.hrl").

-export([
    get/0,
    start/1,
    stop/0
]).

%% public
get() ->
    Options = [{pool, httpc_bench}],
    {ok, _, _, Ref} = hackney:request(get, ?URL, ?HEADERS, <<>>, Options),
    {ok, _} = hackney:body(Ref),
    ok.

start(PoolSize) ->
    ok = hackney:start(),
    HackneyOps = [
        {pool_size, PoolSize},
        {timeout, ?TIMEOUT}
    ],
    ok = hackney_pool:start_pool(httpc_bench, HackneyOps).

stop() ->
    ok = hackney:stop().
