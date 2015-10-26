%%%-------------------------------------------------------------------
%%% @author ryanpbrewster1
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Oct 2015 5:49 PM
%%%-------------------------------------------------------------------
-module(problem001).
-include_lib("eunit/include/eunit.hrl").
-author("ryanpbrewster1").

%% API
-export([start/0, solve/0]).

start() -> io:format("~p\n", [solve()]).

solve() -> smartSolve(999).

smartSolve(Hi) ->
  N3 = Hi div 3,
  N5 = Hi div 5,
  N15 = Hi div 15,
  C3 = 3*(N3*(N3+1) div 2), % = 3 + 6 + 9 + ... + 999
  C5 = 5*(N5*(N5+1) div 2), % = 5 + 10 + ... + 995
  C15 = 15*(N15*(N15+1) div 2), % = 15 + 30 + ... + 990
  C3 + C5 - C15.

bruteForce(Hi, Ns) -> bruteForceHelper(1, Hi, Ns).

bruteForceHelper(Lo, Hi, _) when Lo > Hi -> 0;
bruteForceHelper(X, Hi, Ns) ->
  case divisibleBy(X, Ns) of
    true -> X + bruteForceHelper(X+1, Hi, Ns);
    false -> bruteForceHelper(X+1, Hi, Ns)
  end.

divisibleBy(_, []) -> false;
divisibleBy(X, [N|_]) when (X rem N) == 0 -> true;
divisibleBy(X, [_|Ns]) -> divisibleBy(X, Ns).


bruteForce_test() ->
  [
    ?assert(smartSolve(   10) =:= bruteForce(   10, [3,5])),
    ?assert(smartSolve(   50) =:= bruteForce(   50, [3,5])),
    ?assert(smartSolve(  100) =:= bruteForce(  100, [3,5])),
    ?assert(smartSolve( 1000) =:= bruteForce( 1000, [3,5])),
    ?assert(smartSolve(10000) =:= bruteForce(10000, [3,5]))
  ].
