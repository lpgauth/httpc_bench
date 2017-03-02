erl -pa _build/compile/lib/*/ebin \
    +K true \
    +scl false \
    +spp true \
    -noshell \
    -eval 'httpc_bench_server:start().'
