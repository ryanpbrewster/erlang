%%%-------------------------------------------------------------------
%%% @author ryanpbrewster1
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Oct 2015 9:07 PM
%%%-------------------------------------------------------------------
-module(collatz).
-author("ryanpbrewster1").

%% API
-export([start/0, master/1, slave/0, delegate/4]).

start() ->
  SlavePID = spawn(collatz, slave, []),
  MasterPID = spawn(collatz, master, [10]),
  spawn(collatz, delegate, [1, 10, MasterPID, SlavePID]).

delegate(Lo, Hi, _, SlavePID) when Lo > Hi -> SlavePID ! done;
delegate(Lo, Hi, MasterPID, SlavePID) ->
  SlavePID ! {compute_request, Lo, MasterPID},
  delegate(Lo+1, Hi, MasterPID, SlavePID).

master(0) -> io:fwrite("Master signing off\n");
master(K) ->
  receive
    {N, C} -> io:fwrite("collatz for " ++ integer_to_list(N) ++ " = " ++ integer_to_list(C) ++ "\n")
  end,
  master(K-1).

slave() ->
  receive
    done -> io:fwrite("Slave signing off\n");
    {compute_request, N, MasterPID} ->
      C = collatz(N),
      MasterPID ! {N,C},
      slave()
  end.

collatz(N) -> collatzHelper(N, 1).

collatzHelper(1, C) -> C;
collatzHelper(N, C) ->
  case (N rem 2) of
    0 -> collatzHelper(N div 2, C+1);
    1 -> collatzHelper(3*N+1, C+1)
  end.
