erl -pa _build/compile/lib/*/ebin \
    +K true \
    -noshell \
    -eval 'httpc_bench_server:start().'
