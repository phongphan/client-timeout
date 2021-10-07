APPNAME=cowboy
REBAR=`which rebar3 || echo ./rebar3`

all: deps compile

deps:
	@( $(REBAR) get-deps )

compile:
	@( $(REBAR) compile )

clean:
	@( $(REBAR) clean )

run:
	@( $(REBAR) shell )

.PHONY: all, deps, compile
