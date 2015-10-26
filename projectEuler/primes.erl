%%%-------------------------------------------------------------------
%%% @author ryanpbrewster1
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Oct 2015 9:48 PM
%%%-------------------------------------------------------------------
-module(primes).
-author("ryanpbrewster1").

%% API
-export([factor/1]).

factor(N) when is_integer(N), N > 0 -> factorHelper(N, 2, []).

factorHelper(N, P, Fs) when P*P > N -> [N|Fs];
factorHelper(N, P, Fs) ->
  case (N rem P) of
    0 -> factorHelper(N div P, P, [P|Fs]);
    _ -> factorHelper(N, P+1, Fs)
  end.
