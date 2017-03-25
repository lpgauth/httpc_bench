-module(httpc_bench).
-include("httpc_bench.hrl").

-export([
    run/0
]).

-define(N, 2048000).

-define(CLIENTS, [
    httpc_bench_buoy,
    httpc_bench_dlhttpc,
    httpc_bench_hackney,
    httpc_bench_httpc,
    httpc_bench_ibrowse,
    httpc_bench_katipo
]).
-define(CONCURENCIES, [32, 64, 128, 512, 2048, 4096]).
-define(POOL_SIZES, [8, 16, 32, 64, 128, 256]).

%% public
run() ->
    error_logger:tty(false),
    io:format("Running benchmark...~n~n" ++
        "Client  PoolSize  Concurency  Requests/s  Error %~n" ++
        [$= || _ <- lists:seq(1, 49)] ++ "~n", []),
    run_client(?CLIENTS, ?POOL_SIZES, ?CONCURENCIES, ?N).

%% private
lookup(Key, List) ->
    case lists:keyfind(Key, 1, List) of
        false -> undefined;
        {_, Value} -> Value
    end.

name(Client, PoolSize, Concurency) ->
    list_to_atom(Client ++ "_" ++ integer_to_list(PoolSize) ++
        "_" ++ integer_to_list(Concurency)).

run_client([], _PoolSizes, _Concurencies, _N) ->
    ok;
run_client([Client | T], PoolSizes, Concurencies, N) ->
    run_pool_size(Client, PoolSizes, Concurencies, N),
    run_client(T, PoolSizes, Concurencies, N).

run_pool_size(_Client, [], _Concurencies, _N) ->
    ok;
run_pool_size(Client, [PoolSize | T], Concurencies, N) ->
    run_concurency(Client, PoolSize, Concurencies, N),
    run_pool_size(Client, T, Concurencies, N).

run_concurency(_Client, _PoolSize, [], _N) ->
    ok;
run_concurency(Client, PoolSize, [Concurency | T], N) ->
    Client:start(PoolSize),
    {_Prefix, Client2} = lists:split(12, atom_to_list(Client)),
    Name = name(Client2, PoolSize, Concurency),
    Fun = fun() -> Client:get() end,
    Results = timing_hdr:run(Fun, [
        {name, Name},
        {concurrency, Concurency},
        {iterations, N},
        {output, "output/" ++ atom_to_list(Name)}
    ]),
    Qps = lookup(success, Results) / (lookup(total_time, Results) / 1000000),
    Errors = lookup(errors, Results) / lookup(iterations, Results) * 100,
    io:format("~-8s ~7B ~11B ~11B ~8.1f~n",
        [Client2, PoolSize, Concurency, trunc(Qps), Errors]),
    Client:stop(),
    run_concurency(Client, PoolSize, T, N).
