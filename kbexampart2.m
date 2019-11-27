%% Kris Bickham
%% Midterm, part 2 (transfer function)
%% 

syms s

%% generating an array now, different

num = [2 5] %% [power 2 then 1 ]
denom = [3 3 2 0 1] %% descending powers, it knows last one is constant
sys = tf(num,denom);

isstable(sys) %% answer = 1 stable
pole(sys)
zero(sys)
pzmap(sys)



