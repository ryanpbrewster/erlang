%%%-------------------------------------------------------------------
%%% @author ryanpbrewster1
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Oct 2015 12:18 AM
%%%-------------------------------------------------------------------
-module(fact).
-author("ryanpbrewster").

%% API
-export([start/0,fact/1]).

start() -> io:fwrite(integer_to_list(fact(5)) ++ "\n").

fact(0) -> 1;
fact(N) -> N * fact(N-1).
