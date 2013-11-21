%DQWL Simulate the discrete quantum on a line.
%
%   DQWL(n)     Simulate the discrete quantum on a line.
%       n:      the number of steps of the quantum walk.
%       return: a (2*n+1)-dimension vector representing the probability at 
%               each position after n-steps of quantum walk.                   

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function s_p = dqwl(n)                  

    d = 2 * n + 1;                          % the dimension of position states
    H   = (1/sqrt(2)) * [1,1;1,-1];         % the Hadamard transformation for a qubit
    
    M_c = kron(eye(d), H);                  % the coin transformation 
    M_p = dqwl_postrans(n);                 % the position transformation    
    M   = M_p * M_c;                        % the whole transformation

    s_c = (1/sqrt(2)) * [1, i; i, 1];       % the coin state
    s_p = basis(d, n+1);                    % the position state
    s   = kron(s_p, s_c);                   % the whole state

    for k = 1 : n
        s = M * s;
    end
    s_p = dqwl_measure(s, n);               % measure the position state
end    