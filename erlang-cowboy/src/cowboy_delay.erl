-module(cowboy_delay).

-export([start/0]).

start() ->
    {ok, _} = application:ensure_all_started(cowboy_delay),
    ok.

