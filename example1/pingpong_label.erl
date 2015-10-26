%%%-------------------------------------------------------------------
%%% @author ryanpbrewster1
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Oct 2015 9:59 PM
%%%-------------------------------------------------------------------
-module(pingpong_label).
-author("ryanpbrewster1").

%% API
-export([start/0, ping/2, pong/0]).

start() ->
  PongPID = spawn(pingpong_label, pong, []),
  spawn(pingpong_label, ping, [3, PongPID]).


ping(0, PongPID) -> PongPID ! done;
ping(N, PongPID) ->
  io:fwrite("Sending a ping, this many left: " ++ integer_to_list(N) ++ "\n"),
  PongPID ! {ping_msg, N, self()},
  receive
    pong_msg -> io:fwrite("Got a pong\n")
  end,
  ping(N-1, PongPID).

pong() ->
  receive
    done -> io:fwrite("Pong signing off\n");
    {ping_msg, Msg, PingPID} ->
      io:fwrite("Got a ping with message " ++ integer_to_list(Msg) ++ "\n"),
      PingPID ! pong_msg,
      pong()
  end.
