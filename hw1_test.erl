% EUnit tests for hw1.
% I've written some tests for fib.  You are welcome to write more.
% You need to write tests for flatten_too_many_ifs and flatten. 

-module(hw1_test).

-include_lib("eunit/include/eunit.hrl").
-import(hw1, [fib/1, flatten/1, flatten_too_many_ifs/1]).

-export([floor_log10/1]).


floor_log10(N) when is_integer(N), N >= 10 ->
  1 + floor_log10(N div 10);
floor_log10(_) -> 0.

fib_test() ->
  ?assertEqual(0, fib(0)),
  ?assertEqual(1, fib(1)),
  ?assertEqual(1, fib(2)),
  ?assertEqual(2, fib(3)),
  ?assertEqual(3, fib(4)),
  ?assertEqual(5, fib(5)),
  ?assertEqual(55, fib(10)),
  ?assertEqual(354224848179261915075, fib(100)),
  ?assertEqual(20898, floor_log10(fib(100000))), % fib(100000) has 20899 decimal digits.
  ?assertEqual(3072458, fib(100000) rem 7358213).


flatten_too_many_ifs_test() ->
   ?assertEqual([], flatten_too_many_ifs([])),
   ?assertEqual([1], flatten_too_many_ifs([1])),
   ?assertEqual([1,2], flatten_too_many_ifs([1,[2]])),
   ?assertEqual([1,2,3,4,5,6], flatten_too_many_ifs([1,[2,3],[4,5,6]])),
   ?assertEqual([1,2,3,4,5,6,7], flatten_too_many_ifs([1,[2,3],[4,5,6], 7])),
    ?assertError("flatten_too_many_ifs(X): X is not a list",flatten_too_many_ifs(1) ).

flatten_test() ->
   ?assertEqual([], flatten([])),
   ?assertEqual([1], flatten([1])),
   ?assertEqual([1,2], flatten([1,[2]])),
   ?assertEqual([1,2,3,4,5,6], flatten([1,[2,3],[4,5,6]])),
   ?assertEqual([1,2,3,4,5,6,7], flatten([1,[2,3],[4,5,6], 7])),
   ?assertError("flatten(X): X is not a list",flatten(1) ).