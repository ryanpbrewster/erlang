%%%-------------------------------------------------------------------
%%% @author ryanpbrewster1
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Oct 2015 12:08 AM
%%%-------------------------------------------------------------------
-module(hello_world).
-author("ryanpbrewster").

%% API
-export([hello/0]).

hello() -> io:fwrite("hello, world\n").
