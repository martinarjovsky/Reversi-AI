function [ moves ] = findValidMoves(s, player)

% Finds which are valid moves for a player 'player' in a given state 's'.
    oplayer = abs(player-3);
    counter = 1;
    moves = [];
    
    for a = 1: 64
        if (mod(a, 8) == 0) % Vectorizes a
            am = [a/8; 8];
        else
            am = [floor(a/8)+1; mod(a, 8)];
        end
        
        counter2 = counter;
        if  (s(am(1), am(2)) == 0)
            if (am(1) < 7)
                if (s(am(1) + 1, am(2)) == oplayer)
                    for j = am(1) + 2: 8
                        if ( s(j, am(2)) == oplayer)
                            continue
                        else if (s(j, am(2)) == 0)
                                break
                            else
                                moves(counter) = a;
                                counter = counter + 1;
                                break
                            end
                        end
                    end
                end
            end
            if (counter2 ~= counter)
                continue
            end
            if (am(1) > 2)
                if (s(am(1) - 1, am(2)) == oplayer)
                    for j = am(1) -2: -1: 1
                        if ( s(j, am(2)) == oplayer)
                            continue
                        else if (s(j, am(2)) == 0)
                                break
                            else
                                moves(counter) = a;
                                counter = counter + 1;
                                break
                            end
                        end
                    end
                end
            end
            if (counter2 ~= counter)
                continue
            end
            if (am(2) < 7)
                if (s(am(1), am(2) + 1) == oplayer)
                    for j = am(2) + 2: 8
                        if ( s(am(1), j) == oplayer)
                            continue
                        else if (s(am(1), j) == 0)
                                break
                            else
                                moves(counter) = a;
                                counter = counter + 1;
                                break
                            end
                        end
                    end
                end
            end
            if (counter2 ~= counter)
                continue
            end
            if (am(2) > 2)
                if (s(am(1), am(2) - 1) == oplayer)
                    for j = am(2) - 2: -1: 1
                        if ( s(am(1), j) == oplayer)
                            continue
                        else if (s(am(1), j) == 0)
                                break
                            else
                                moves(counter) = a;
                                counter = counter + 1;
                                break
                            end
                        end
                    end
                end
            end
            if (counter2 ~= counter)
                continue
            end
            if (am(1) < 7 && am(2) < 7)
                if (s(am(1) + 1, am(2) + 1) == oplayer)
                    for j = 2: 8 - max(am(1), am(2))
                        if ( s(am(1) + j, am(2) + j) == oplayer)
                            continue
                        else if (s(am(1) + j, am(2) + j) == 0)
                                break
                            else
                                moves(counter) = a;
                                counter = counter + 1;
                                break
                            end
                        end
                    end
                end
            end
            if (counter2 ~= counter)
                continue
            end
            if (am(1) > 2 && am(2) > 2)
                if (s(am(1) - 1, am(2) - 1) == oplayer)
                    for j = 2: min(am(1), am(2)) - 1
                        if ( s(am(1) - j, am(2) - j) == oplayer)
                            continue
                        else if (s(am(1) - j, am(2) - j) == 0)
                                break
                            else
                                moves(counter) = a;
                                counter = counter + 1;
                                break
                            end
                        end
                    end
                end
            end
            if (counter2 ~= counter)
                continue
            end
            if (am(1) > 2 && am(2) < 7)
                if (s(am(1) - 1, am(2) + 1) == oplayer)
                    for j = 2: min(am(1) - 1, 8 - am(2))
                        if ( s(am(1) - j, am(2) + j) == oplayer)
                            continue
                        else if (s(am(1) - j, am(2) + j) == 0)
                                break
                            else
                                moves(counter) = a;
                                counter = counter + 1;
                                break
                            end
                        end
                    end
                end
            end
            if (counter2 ~= counter)
                continue
            end
            if (am(1) < 7 && am(2) > 2)
                if (s(am(1) + 1, am(2) - 1) == oplayer)
                    for j = 2: min(8 - am(1), am(2) - 1)
                        if ( s(am(1) + j, am(2) - j) == oplayer)
                            continue
                        else if (s(am(1) + j, am(2) - j) == 0)
                                break
                            else
                                moves(counter) = a;
                                counter = counter + 1;
                                break
                            end
                        end
                    end
                end
            end
            if (counter2 ~= counter)
                continue
            end
        end
    end
end