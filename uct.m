function [ a_next ] = uct (s_start, player, num_simulaciones, max_steps, heuristic1, heuristic2)


% This function uses the UCT algorithm to choose the next action a_next given the following parameters:
%
%   s_start: the current state in which to perform a_next. This is an 8x8 matrix representing the board
%       of the game. This matrix has 0s in unclaimed possitions, 1s in positions owned by player 1 and
%       2s in positions owned by player 2.
%   player: the player that will perform a_next. 1 if is the black player, and 2 if it is the white player.
%   num_simulaciones: the number of game simulations performed by UCT.
%   max_steps: the depth of the selection process performed by UCT. After this, the pseudorandom simulation
%       process starts.
%   heuristic1: this is the heuristic performed after the selection process untill the game ends. Set this
%       parameter to 1 to use the heuristic11.m (totally random heuristic) and 2 to use heuristic12.m (pseudorandom
%       heuristic based on board priorities). Using heuristic1 = 2 usually outperforms greatly to using heuristic1 = 1
%   heuristic2: this is the reward function. Set this parameter to 1 to use heuristic21.m or set it to 2 to
%       use heuristic22.m. Using heuristic21.m usually leads to much better performance. To see how each of
%       this reward function works, check out the corresponding code.
%
% The actions (including a_next) are represented as integers from 1 to 64 inclusive, representing which 
%   position to claim. The indexing is representing the 8x8 matrix as an uninterrupted vector, with rows
%   having consecutive values.

    import dec_tree
     
    start_node = dec_tree;
    start_node.board = s_start;
    start_node.player = player;
    start_node.actions = findValidMoves(s_start,player);
    start_node.parent = 0;
    start_node.reward = 0;
    
    start_node.children = dec_tree;
    
    for i = 1:length(start_node.actions)
        [ s_next, r, eoe, validMoves, nplayer ]= doAction(start_node.board, start_node.actions(i), start_node.player, heuristic2);
        start_node.children(i) = dec_tree;
        start_node.children(i).board = s_next;
        start_node.children(i).player = nplayer;
        start_node.children(i).actions = validMoves;
        start_node.children(i).eoe = eoe;
        start_node.children(i).reward = r;
        start_node.children(i).parent = start_node;
        
        start_node.children(i).Q = zeros(1, length(validMoves));
        start_node.children(i).n = zeros(1, length(validMoves));
    end
    start_node.Q = zeros(1, length(start_node.children));
    start_node.n = zeros(1, length(start_node.children));
    
%   Uncomment this line to plot learning curves
%    Qplot = zeros(num_simulaciones, length(start_node.children));
   
    for sims = 1: num_simulaciones
           
        nodes = dec_tree;
        actions = [];
        steps = 1;
        nodes(1) = start_node;
        current_node = start_node;
        eoe = false;
        j = 2;
        
        while (~eoe && steps<max_steps)
            q = zeros(1, length(current_node.children));
            n = 0;
            for i = 1:length(current_node.children)
                n = n + current_node.n(i);
            end
            for i = 1:length(current_node.children)
                if (current_node.n(i) == 0)
                    q(i) = 10000;
                else
                    if (player == current_node.player) % MINIMAX
                        q(i) = current_node.Q(i) + sqrt(2*log10(n)/current_node.n(i));
                    else
                        q(i) = -current_node.Q(i) + sqrt(2*log10(n)/current_node.n(i));
                    end
                end
            end
            as = find(q==max(q));
            a = as(randi(length(as)));
            next = current_node.children(a);
            eoe = next.eoe;
            if (current_node.n(a) == 0 && ~eoe)
                next.children = dec_tree;
                for i = 1:length(next.actions)
                    [ s_next, r, eoe, validMoves, nplayer ]= doAction(next.board, next.actions(i), next.player, heuristic2);
                    next.children(i).board = s_next;
                    next.children(i).player = nplayer;
                    next.children(i).actions = validMoves;
                    next.children(i).eoe = eoe;
                    next.children(i).reward = r;
                    next.children(i).parent = next;
                    next.children(i).Q = zeros(1, length(validMoves));
                    next.children(i).n = zeros(1, length(validMoves));
                end
            end
            nodes(j) = next;
            actions(j-1) = a;
            current_node = next;
            j = j + 1;
            steps = steps + 1;
            R = next.reward(player);
        end
        
        if (~eoe)
            s_next = nodes(end).board;
            nplayer = nodes(end).player;
            val = nodes(end).actions;
            while (~eoe)
                if (heuristic1 == 1)
                    a = heuristic11 (val);
                elseif (heuristic1 == 2)
                    a = heuristic12 (val);
                end
                [ s_next, reward, eoe, val, nplayer ]= doAction(s_next, a, nplayer, heuristic2);
            end
            R = reward(player);
        end
        
        
        for i = 1:length(nodes)-1
            nodes(i).n(actions(i)) = nodes(i).n(actions(i)) + 1;
            nodes(i).Q(actions(i)) = nodes(i).Q(actions(i)) + (R - nodes(i).Q(actions(i)))/nodes(i).n(actions(i));
        end

%   Uncomment this line to plot learning curves
%        Qplot(sims, :) = start_node.Q;
        
    end


    as = find(start_node.Q==max(start_node.Q));
    a = as(randi(length(as)));
    a_next = start_node.actions(a);
    
    delete(start_node);
end
