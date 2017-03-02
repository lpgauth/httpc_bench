erl -pa _build/compile/lib/*/ebin \
    +K true \
    +scl false \
    +spp true \
    -noshell \
    -eval 'httpc_bench:run(), init:stop().'
