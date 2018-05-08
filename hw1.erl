-module (hw1).
-export ([awful_fib/1, fib2/1, fib/1, flatten_too_many_ifs/1, flatten/1]).
-export ([you_need_to_write_this/0,q2a/0,q2b/0,q2c/0,q2d/0,fib_time/0]).

% Q1: Fibonacci numbers
awful_fib(0) -> 0;
awful_fib(1) -> 1;
awful_fib(N) when is_integer(N), N > 1 ->
  awful_fib(N-2) + awful_fib(N-1).

fib2(1) -> {0, 1};
fib2(N)->
	{X,Y} = fib2(N-1),
	{Y,X+Y}.


%  you_need_to_write_this().
    


%fib(0) -> you_need_to_write_this();
fib(0) -> 0;
%fib(_N) -> element(2,fib2(_N)).
fib(N)  when is_integer(N), N>=1->
{_,Z}= fib2(N), Z. 


fib_time()->code:add_path("/home/c/cs418/public_html/resources/erl"),[io:format("~w ~n",[[N|time_it:t(fun()->fib(N)end)]])||
N<- [1, 10,100,1000,10000,100000]].
% Q2: Timing measurements
%   Write code to measure the runtime of lists:nth, length, element, and ++.
%   Include comments explaining how your code works and how to run it to
%   get the data that you reported in you solution.  You should gather your
%   data on a machine in the ugrad.cs.ubc.ca domain and state what machine
%   you used so we can repeat your experiments.



q2a()-> code:add_path("/home/c/cs418/public_html/resources/erl"),L1M =lists:seq(1,1000000),[io:format("~w ~n",[[N|time_it:t(fun()->lists:nth(N,L1M) end)]])||
N<- [1, 10, 100, 1000, 10000, 100000, 1000000]].





q2b()->code:add_path("/home/c/cs418/public_html/resources/erl"),[io:format("~w ~n",[[length(L)|time_it:t(fun()->length(L) end)]])|| L <- [ lists:seq(1,N) || N <- [1, 10, 100, 1000, 10000, 100000, 1000000] ] ].




q2c()-> code:add_path("/home/c/cs418/public_html/resources/erl"),L1M =lists:seq(1,1000000),T1M =list_to_tuple(L1M),[io:format("~w ~n",[[N|time_it:t(fun()->element(N,T1M)end)]])||
N<- [1, 10,100,1000,10000,100000,1000000]]. 



q2d()->code:add_path("/home/c/cs418/public_html/resources/erl"),[ io:format("~w ~n",[[{length(N1),length(N2)} | time_it:t(fun() ->N1++N2 end)]]) || 
     N1 <- [[], lists:seq(1,10),lists:seq(1,100),lists:seq(1,1000),lists:seq(1,10000),lists:seq(1,100000),lists:seq(1,1000000)],
     N2 <- [[], lists:seq(1,10),lists:seq(1,100),lists:seq(1,1000),lists:seq(1,10000),lists:seq(1,100000),lists:seq(1,1000000)]].







% Q3: flatten_too_many_ifs and flatten
flatten_too_many_ifs(X) ->
  if is_list(X) ->
       if X==[] -> X;
          tl(X) == [] -> X;
          true->
            FlatHead =
            if is_list(hd(X)) -> flatten_too_many_ifs(hd(X));
               true -> hd(X)
            end,
            FlatTail = flatten_too_many_ifs(tl(X)),
            FlatHead ++ FlatTail
        end;
     not is_list(X) ->
       error("flatten_too_many_ifs(X): X is not a list")
  end.



%flatten(X) ->  if is_list(X) ->
%       if X==[] -> X;
%            true->
%            FlatHead =
%            if is_list(hd(X)) -> flatten(hd(X));
%               true -> [hd(X)]
%            end,
%            FlatTail = flatten(tl(X)),
%            FlatHead ++ FlatTail
%        end;
%     not is_list(X) ->
%       error("flatten_too_many_ifs(X): X is not a list")
%  end.

flatten([]) ->[];
flatten([Hd|Tl]) when is_list(Hd) ->flatten(Hd)++flatten(Tl);
flatten([Hd|Tl])->[Hd]++flatten(Tl);
flatten(X) when not is_list(X) -> error("flatten(X): X is not a list").

% you_need_to_write_this(): a place-holder function so that this template
%   code will compile cleanly.  You need to replace each call to
%   you_need_to_write_this with your code that solves the homework problem.
%   If you miss any, you_need_to_write_this will fail with an error message
%   when you try to run your code (as long as your test cases exercise
%   the code).
you_need_to_write_this() ->
  error(error, incomplete_solution).
