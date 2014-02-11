function [ s_next, r, eoe, validMoves, nplayer ]= doAction(s, a, player, heuristic2)

% Given a state 's', a player 'player' and an action 'a' to be performed
% on that that state by that player, it returns the next state 's_next',
% the reward 'r' received by the player performing the action, a boolean
% value 'eoe' if the next state is an end of episode state, the next
% player 'nplayer' and the set of valid moves'validMoves' to perform
% by the next player on the next state.
    r = [0,0];
    eoe = false;
    s_next = s;
    oplayer = abs(player - 3);
    if (mod(a, 8) == 0) % Vectorizes a
            am = [a/8; 8];
    else
            am = [floor(a/8)+1; mod(a, 8)];
    end
        
    if (am(1) < 7)
        for j = am(1) + 1: 8
            if (s_next(j, am(2)) == oplayer)
                continue
            else if (s_next(j, am(2)) == player)
                    s_next(am(1): j, am(2)) = player;
                    break
                else
                    break
                end
            end
        end
    end
    if (am(1) > 2)
        for j = am(1) - 1: -1: 1
            if (s_next(j, am(2)) == oplayer)
                continue
            else if (s_next(j, am(2)) == player)
                    s_next(am(1): -1: j, am(2)) = player;
                    break
                else
                    break
                end
            end
        end
    end
    if (am(2) < 7)
        for j = am(2) + 1: 8
            if (s_next(am(1), j) == oplayer)
                continue
            else if (s_next(am(1), j) == player)
                    s_next(am(1), am(2): j) = player;
                    break
                else
                    break
                end
            end
        end
    end
    if (am(2) > 2)
        for j = am(2) - 1: -1: 1
            if (s_next(am(1), j) == oplayer)
                continue
            else if (s_next(am(1), j) == player)
                    s_next(am(1), am(2): -1: j) = player;
                    break
                else
                    break
                end
            end
        end
    end
    if (am(1) < 7 && am(2) < 7)
        for j = 1: 8 - max(am(1), am(2))
            if (s_next(am(1) + j,am(2) + j) == oplayer)
                continue
            else if (s_next(am(1) + j,am(2) + j) == player)
                    for w = 0:j
                        s_next(am(1) + w, am(2) + w) = player;
                    end
                    break
                else
                    break
                end
            end
        end
    end
    if (am(1) > 2 && am(2) > 2)
        for j = 1: min(am(1), am(2)) - 1
            if (s_next(am(1) - j,am(2) - j) == oplayer)
                continue
            else if (s_next(am(1) - j,am(2) - j) == player)
                    for w = 0:j
                        s_next(am(1) - w, am(2) - w) = player;
                    end
                    break
                else
                    break
                end
            end
        end
    end
    if (am(1) > 2 && am(2) < 7)
        for j = 1: min(am(1) - 1, 8 - am(2))
            if (s_next(am(1) - j,am(2) + j) == oplayer)
                continue
            else if (s_next(am(1) - j,am(2) + j) == player)
                    for w = 0:j
                        s_next(am(1) - w, am(2) + w) = player;
                    end
                    break
                else
                    break
                end
            end
        end
    end
    if (am(1) < 7 && am(2) > 2)
        for j = 1: min(8 - am(1), am(2) - 1)
            if (s_next(am(1) + j,am(2) - j) == oplayer)
                continue
            else if (s_next(am(1) + j,am(2) - j) == player)
                    for w = 0:j
                        s_next(am(1) + w, am(2) - w) = player;
                    end
                    break
                else
                    break
                end
            end
        end
    end
    
    validMoves = findValidMoves(s_next, oplayer);
    nplayer = oplayer;
    if (isempty(validMoves))
        validMoves = findValidMoves(s_next, player);
        nplayer = player;
        if (isempty(validMoves))
            eoe = true;
            nplayer = 0;
            if (heuristic2 == 1)
                r = heuristic21(s_next);
            elseif (heuristic2 == 2)
                r = heuristic22(s_next);
            end
            
        end
    end
end
    
    