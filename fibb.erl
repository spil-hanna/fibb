-module(fibb).

-export([
	 fibb/1, 
	 list_count/1, 
	 fibb_diff/1
	]).

fibb_helper(X, X, F, _F1) ->
	F;

fibb_helper(X, K, F, F1) ->
	% F == fibb(K)
	% F1 == fibb(K-1)
	fibb_helper(X, K+1, F+F1, F).

fibb(1) -> 1;
fibb(2) -> 1;
fibb(X) ->
	fibb_helper(X, 2, 1, 1).


list_count_helper([], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
	[C0, C1, C2, C3, C4, C5, C6, C7, C8, C9];

list_count_helper([$0|T], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
	list_count_helper(T, [C0+1, C1, C2, C3, C4, C5, C6, C7, C8, C9]);

list_count_helper([$1|T], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
	list_count_helper(T, [C0, C1+1, C2, C3, C4, C5, C6, C7, C8, C9]);

list_count_helper([$2|T], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
	list_count_helper(T, [C0, C1, C2+1, C3, C4, C5, C6, C7, C8, C9]);

list_count_helper([$3|T], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
	list_count_helper(T, [C0, C1, C2, C3+1, C4, C5, C6, C7, C8, C9]);

list_count_helper([$4|T], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
	list_count_helper(T, [C0, C1, C2, C3, C4+1, C5, C6, C7, C8, C9]);

list_count_helper([$5|T], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
	list_count_helper(T, [C0, C1, C2, C3, C4, C5+1, C6, C7, C8, C9]);

list_count_helper([$6|T], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
	list_count_helper(T, [C0, C1, C2, C3, C4, C5, C6+1, C7, C8, C9]);

list_count_helper([$7|T], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
	list_count_helper(T, [C0, C1, C2, C3, C4, C5, C6, C7+1, C8, C9]);

list_count_helper([$8|T], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
	list_count_helper(T, [C0, C1, C2, C3, C4, C5, C6, C7, C8+1, C9]);

list_count_helper([$9|T], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
	list_count_helper(T, [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9+1]).

list_count(L) ->
	list_count_helper(L, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]).

fibb_diff(N) ->
	F = fibb(N),
	L = integer_to_list(F),
	LC = list_count(L),
	lists:max(LC) - lists:min(LC).

