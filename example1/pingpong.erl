%%%-------------------------------------------------------------------
%%% @author ryanpbrewster1
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Oct 2015 3:28 PM
%%%-------------------------------------------------------------------
-module(pingpong).
-author("ryanpbrewster").

%% API
-export([start/0, ping/2, pong/0]).

start() ->
    PongPID = spawn(pingpong, pong, []),
    spawn(pingpong, ping, [3, PongPID]).


ping(0, PongPID) -> PongPID ! done;
ping(N, PongPID) ->
    io:fwrite("Sending a ping, this many left: " ++ integer_to_list(N) ++ "\n"),
    PongPID ! {ping_msg, self()},
    receive
        pong_msg -> io:fwrite("Got a pong\n")
    end,
    ping(N-1, PongPID).

pong() ->
    receive
        done -> io:fwrite("Pong signing off\n");
        {ping_msg, PingPID} ->
            io:fwrite("Got a ping\n"),
            PingPID ! pong_msg,
            pong()
    end.
