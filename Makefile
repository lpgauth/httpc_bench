CACHEGRIND=qcachegrind
REBAR3=./bin/rebar3

all: compile

clean:
	@echo "Running rebar3 clean..."
	@$(REBAR3) clean -a

compile:
	@echo "Running rebar3 compile..."
	@$(REBAR3) as compile compile

.PHONY: clean compile
