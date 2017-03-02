% https://github.com/erlang/otp/blob/master/lib/inets/src/http_client/httpc.erl

-module(httpc_bench_httpc).
-include("httpc_bench.hrl").

-export([
    get/0,
    start/1,
    stop/0
]).

%% public
get() ->
    Request = {binary_to_list(?URL), [{"Connection", "Keep-Alive"}]},
    HttpOptions = [{timeout, ?TIMEOUT}],
    {ok, _} = httpc:request(get, Request, HttpOptions, []),
    ok.

start(PoolSize) ->
    inets:start(),
    httpc:set_options([
        {max_keep_alive_length, 1000000},
        {max_pipeline_length, ?PIPELINING},
        {max_sessions, PoolSize}
    ]),
    ok.

stop() ->
    inets:stop().
