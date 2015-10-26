%%%-------------------------------------------------------------------
%%% @author ryanpbrewster1
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Oct 2015 8:41 PM
%%%-------------------------------------------------------------------
-module(collatz_sequential).
-author("ryanpbrewster1").

%% API
-export([collatz/1]).

collatz(N) -> collatzHelper(N, 1).

collatzHelper(1, C) -> C;
collatzHelper(N, C) ->
  case (N rem 2) of
         0 -> collatzHelper(N div 2, C+1);
         1 -> collatzHelper(3*N+1, C+1)
  end.
