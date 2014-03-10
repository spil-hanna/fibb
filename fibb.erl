-module(fibb).

-export([
	 fibb/1, 
	 list_count/1, 
	 fibb_diff/1
	]).

% fibb - calculate fibbonacci sequence
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

% list_count - count occurrance of elements in a list
list_count_helper([], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
	[C0, C1, C2, C3, C4, C5, C6, C7, C8, C9];

list_count_helper([H|T], [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9]) ->
        case H of
		$0 -> list_count_helper(T, [C0+1, C1, C2, C3, C4, C5, C6, C7, C8, C9]);
		$1 -> list_count_helper(T, [C0, C1+1, C2, C3, C4, C5, C6, C7, C8, C9]);
		$2 -> list_count_helper(T, [C0, C1, C2+1, C3, C4, C5, C6, C7, C8, C9]);
		$3 -> list_count_helper(T, [C0, C1, C2, C3+1, C4, C5, C6, C7, C8, C9]);
		$4 -> list_count_helper(T, [C0, C1, C2, C3, C4+1, C5, C6, C7, C8, C9]);
		$5 -> list_count_helper(T, [C0, C1, C2, C3, C4, C5+1, C6, C7, C8, C9]);
		$6 -> list_count_helper(T, [C0, C1, C2, C3, C4, C5, C6+1, C7, C8, C9]);
		$7 -> list_count_helper(T, [C0, C1, C2, C3, C4, C5, C6, C7+1, C8, C9]);
		$8 -> list_count_helper(T, [C0, C1, C2, C3, C4, C5, C6, C7, C8+1, C9]);
		$9 -> list_count_helper(T, [C0, C1, C2, C3, C4, C5, C6, C7, C8, C9+1])
	end. 

list_count(L) ->
	list_count_helper(L, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]).

% fibb_diff <F4> calculate difference of occurance between most frequest and least frequent digit
fibb_diff(N) ->
	F = fibb(N),
	L = integer_to_list(F),
	LC = list_count(L),
	lists:max(LC) - lists:min(LC).

