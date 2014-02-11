function [ act_vec ] = toAct( act1, act2 )
    
% Transforms a pair (row, column) into an action
    act_vec = (act1 - 1)*8 + mod(act2, 8);
    if mod(act2, 8) == 0
        act_vec = act_vec + 8;
    end

end

