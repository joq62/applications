-module(balcony_boot).

-export([start/0]).

start()->
    io:format("Starting:~p~n",[file:get_cwd()]),
    ssl:start(),
    application:start(crypto),
    ok = application:start(ranch), 
    ok = application:start(cowlib), 
    ok = application:start(cowboy),
  %  ok = application:start(gen_mnesia),
    ok = application:start(balcony),
    ok=application:start(websocket).
