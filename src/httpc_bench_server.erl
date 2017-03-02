-module(httpc_bench_server).
-include("httpc_bench.hrl").

-compile(inline).
-compile({inline_size, 512}).

-export([
    start/0,
    stop/0
]).

%% public
start() ->
    case get(?MODULE) of
        undefined ->
            {ok, LSocket} = listen(),
            put(?MODULE, LSocket),
            spawn(fun () -> accept(LSocket) end),
            ok;
        _LSocket ->
            {error, already_started}
    end.

stop() ->
    case get(?MODULE) of
        undefined ->
            {error, not_started};
        LSocket ->
            ok = gen_tcp:close(LSocket),
            put(?MODULE, undefined),
            ok
    end.

%% private
accept(LSocket) ->
    case gen_tcp:accept(LSocket) of
        {ok, Socket} ->
            spawn(fun() -> loop(Socket, <<>>) end),
            accept(LSocket);
        {error, _Reason} ->
            ok
    end.

count_requests([<<>>], N) ->
    {N, <<>>};
count_requests([Buffer], N) ->
    {N, Buffer};
count_requests([_ | T], N) ->
    count_requests(T, N + 1).

listen() ->
    Self = self(),
    spawn(fun () ->
        Options = [binary, {backlog, 4096}, {active, false}, {reuseaddr, true}],
        Self ! gen_tcp:listen(?PORT, Options),
        receive
            _ ->
                ok
        end
    end),
    receive
        {ok, LSocket} ->
            {ok, LSocket}
    end.

loop(Socket, Buffer) ->
    case gen_tcp:recv(Socket, 0) of
        {ok, Data} ->
            Split = binary:split(<<Buffer/binary, Data/binary>>,
                <<"\r\n\r\n">>, [global]),
            {N, Buffer2} = count_requests(Split, 0),
            Responses = [<<"HTTP/1.1 200 OK\r\nServer: Cowboy\r\n",
                "Date: Tue, 07 Mar 2017 01:10:09 GMT\r\n",
                "Content-Length: 164\r\nCache-Control: no-cache\r\n",
                "Connection: Keep-Alive\r\nContent-Type: application/json\r\n",
                "P3P:CP=\"COM NAV INT STA NID OUR IND NOI\"\r\n",
                "Pragma: no-cache\r\n\r\n{\"segment_ids\":[\"516\",\"513\",",
                "\"502\",\"504\",\"508\",\"510\",\"506\",\"512\",\"501\",",
                "\"503\",\"507\",\"509\",\"505\",\"511\",\"401\",\"402\",",
                "\"1500\",\"100\",\"138\",\"1582\",\"181\",\"1722\",\"531\",",
                "\"532\"]}">> || _ <- lists:seq(1, N)],
            case gen_tcp:send(Socket, Responses) of
                ok ->
                    loop(Socket, Buffer2);
                {error, _Reason} ->
                    ok
            end;
        {error, _Reason} ->
            ok
    end.
