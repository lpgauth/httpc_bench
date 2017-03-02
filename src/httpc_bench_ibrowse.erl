% https://github.com/cmullaparthi/ibrowse

-module(httpc_bench_ibrowse).
-include("httpc_bench.hrl").

-export([
    get/0,
    start/1,
    stop/0
]).

%% public
get() ->
    case ibrowse:send_req(binary_to_list(?URL), [], get) of
        {error, retry_later} ->
            {error, retry_later};
        {ok, _, _, _} ->
            ok
    end.

start(PoolSize) ->
    ok = application:start(ibrowse),
    Options = [
        {max_sessions, PoolSize},
        {max_pipeline_size, ?PIPELINING}
    ],
    ok = ibrowse:set_dest(binary_to_list(?HOSTNAME), ?PORT, Options).

stop() ->
    ok = application:stop(ibrowse).
