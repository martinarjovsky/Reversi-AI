function [ r ] = heuristic21 (S)

% Gives a reward 'r' of +1 to the winner and -1 to the looser, or 0 to
% both if its a tie.

    r = [0, 0];
    counter1 = 0;
    counter2 = 0;

    for j = 1: 64
        if (S(j) == 1)
        counter1 = counter1 + 1;
        else if (S(j) == 2)
               counter2 = counter2 + 1;
            end
        end
    end

    if (counter1 > counter2)
       r = [1, -1];
    else if (counter1 < counter2)
            r = [-1, 1];
        end
    end
end