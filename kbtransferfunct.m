%% 10-4-17 kris bickham
%% solver for RLC circuit
%% 

syms s

%% generating an array now, different

num = [2 5] %% [power 2 then 1 ]
denom = [3 3 2 0 1] %% descending powers, it knows last one is constant
G = tf(num,denom);

isstable(G) %% answer = 1 stable
impulse(G)%% you can't just plot it, you have to do this


