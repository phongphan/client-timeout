-module(cowboy_delay_app).

-behavior(application).

-export([start/2, stop/1]).

start(_, _args) ->
  Dispatch = cowboy_router:compile([
    {'_', [
      {"/delay/:seconds", delay_handler, []}
    ]}
  ]),
  {ok, _} = cowboy:start_clear(my_http_listener,
    [{port, 3000}],
    #{env => #{dispatch => Dispatch},
    middlewares => [cowboy_router, cowboy_handler]
  }),
  cowboy_delay_sup:start_link().

stop(_State) ->
    ok = cowboy:stop_listener(my_http_listener).
