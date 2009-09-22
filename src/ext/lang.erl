
-module(lang).

-export([for/2, for/3]).
-export([test/0]).

%for(Max,Max,F) -> F(Max);
%for(I,Max,F) -> F(I),for(I+1,Max,F).

%for(Max, Max,F) -> [F(Max)];
%for(I, Max, F) -> [F(I)|for(I+1), Max, F)]. 

% lists:each(lists:seq(Min, Max), F).
 
for(N, Fun) -> for(N, 0, Fun).

for(_N, _N, _Fun) ->
	ok;

for(N, Count, Fun) ->
	Fun(Count),
	for(N, Count + 1, Fun).

log(I) -> io:format("[~p] loop ~n", [I]).

test() ->
	for(3, fun log/1).