-module(httpc_bench_cowboy).
-include("httpc_bench.hrl").

-compile(inline).
-compile({inline_size, 512}).

-export([
    start/0,
    stop/0,
    init/2,
    info/3
]).

%% public
start() ->
    application:ensure_all_started(cowboy),
    Dispatch = cowboy_router:compile([{'_', [{"/hello", ?MODULE, []}]}]),
    {ok, _} = cowboy:start_clear(httpc_bench_cowboy,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ).

stop() ->
    cowboy:stop_listener(httpc_bench_cowboy).

%% private
init(Req, State) ->
    self() ! {reply, <<"world">>},
    {cowboy_loop, Req, State}.

info({reply, Body}, Req, State) ->
    cowboy_req:reply(200, #{}, Body, Req),
    {stop, Req, State};
info(_Msg, Req, State) ->
    {ok, Req, State, hibernate}.
