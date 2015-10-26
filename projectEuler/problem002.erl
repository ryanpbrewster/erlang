%%%-------------------------------------------------------------------
%%% @author ryanpbrewster1
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Oct 2015 8:47 PM
%%%-------------------------------------------------------------------
-module(problem002).
-include_lib("eunit/include/eunit.hrl").
-author("ryanpbrewster1").

%% API
-export([start/0, solve/0,fibonaccisUpTo/1,fibonaccisUpTo/2]).

start() -> io:format("~p\n", [solve()]).

solve() -> lists:sum([ X || X <- fibonaccisUpTo(4000000), X rem 2 =:= 0 ]).

fibonaccisUpTo(Hi) -> lists:reverse(fibonaccisUpTo(Hi, [1,1])).
fibonaccisUpTo(Hi, [A|[B|Fs]]) ->
  X = A + B,
  if
    X > Hi -> [A|[B|Fs]];
    true -> fibonaccisUpTo(Hi, [X|[A|[B|Fs]]])
  end.

simple_test() ->
  [
    ?assert(fibonaccisUpTo(10) =:= [1,1,2,3,5,8])
  ].
