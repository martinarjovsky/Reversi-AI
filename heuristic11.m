function [a] = heuristic11 (validMoves)

% chooses action randomly

    a = validMoves(randi(length(validMoves)));

end