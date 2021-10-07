-module(delay_handler).

-export([init/2, terminate/3]).

init(Req, State) ->
  {Seconds, _} = string:to_integer(cowboy_req:binding(seconds, Req)),
  io:fwrite("Delay ~B seconds~n", [Seconds]),
  timer:sleep(Seconds * 1000),
  io:fwrite("Delay Finished~n", []),
  Res = cowboy_req:reply(200, #{
    <<"content-type">> => <<"text/plain">>
  }, io_lib:format("Delay ~B seconds", [Seconds]), Req),
  {ok, Res, State}.

terminate(_Reason, _Req, _State) ->
  ok.

