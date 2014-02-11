distcomp.feature( 'LocalUseMpiexec', false );
matlabpool

%% Studies the performance of UCT when changing the number of simulations

% Elapsed time is 27298.248452 seconds.
rtot11 = [0,0];
rtot12 = [0,0];
tic;
parfor i = 1:100
    s_start = zeros(8);
    s_start(4, 4) = 2; s_start(5, 5) = 2;
    s_start(5, 4) = 1; s_start(4, 5) = 1;

    eoe = false;
    s = s_start;
    player = 1;

    while (eoe == false)
        if (player == 1)
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 2000, 4, 2, 1), player, 1);
        else
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 1000, 4, 2, 1), player, 1);
        end
    end
    rtot11 = rtot11 + r;
end
parfor i = 1:100
    s_start = zeros(8);
    s_start(4, 4) = 2; s_start(5, 5) = 2;
    s_start(5, 4) = 1; s_start(4, 5) = 1;

    eoe = false;
    s = s_start;
    player = 1;

    while (eoe == false)
        if (player == 2)
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 2000, 4, 2, 1), player, 1);
        else
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 1000, 4, 2, 1), player, 1);
        end
    end
    rtot12 = rtot12 + r;
end
toc;
save('stat1')


%% Studies the performance of UCT when changing the depth

% Elapsed time is 48445.764438 seconds.
rtot21 = [0,0];
rtot22 = [0,0];
tic;
parfor i = 1:100
    s_start = zeros(8);
    s_start(4, 4) = 2; s_start(5, 5) = 2;
    s_start(5, 4) = 1; s_start(4, 5) = 1;

    eoe = false;
    s = s_start;
    player = 1;

    while (eoe == false)
        if (player == 1)
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 2000, 6, 2, 1), player, 1);
        else
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 2000, 4, 2, 1), player, 1);
        end
    end
    rtot21 = rtot21 + r;
end
parfor i = 1:100
    s_start = zeros(8);
    s_start(4, 4) = 2; s_start(5, 5) = 2;
    s_start(5, 4) = 1; s_start(4, 5) = 1;

    eoe = false;
    s = s_start;
    player = 1;

    while (eoe == false)
        if (player == 2)
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 2000, 6, 2, 1), player, 1);
        else
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 2000, 4, 2, 1), player, 1);
        end
    end
    rtot22 = rtot22 + r;
end
toc;
save('stat2')


%% Studies the performance of UCT when using the priority heuristic

% Elapsed time is 10156.651767 seconds.
rtot31 = [0,0];
rtot32 = [0,0];
tic;
parfor i = 1:50
    s_start = zeros(8);
    s_start(4, 4) = 2; s_start(5, 5) = 2;
    s_start(5, 4) = 1; s_start(4, 5) = 1;

    eoe = false;
    s = s_start;
    player = 1;

    while (eoe == false)
        if (player == 1)
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 1000, 4, 2, 1), player, 1);
        else
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 1000, 4, 1, 1), player, 1);
        end
    end
    rtot31 = rtot31 + r;
end
parfor i = 1:50
    s_start = zeros(8);
    s_start(4, 4) = 2; s_start(5, 5) = 2;
    s_start(5, 4) = 1; s_start(4, 5) = 1;

    eoe = false;
    s = s_start;
    player = 1;

    while (eoe == false)
        if (player == 2)
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 1000, 4, 2, 1), player, 1);
        else
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 1000, 4, 1, 1), player, 1);
        end
    end
    rtot32 = rtot32 + r;
end
toc;
save('stat3')


%% Studies the performance of UCT when using the reward heuristic

% Elapsed time is 9174.134088 seconds.

rtot41 = [0,0];
rtot42 = [0,0];
tic;
parfor i = 1:50
    s_start = zeros(8);
    s_start(4, 4) = 2; s_start(5, 5) = 2;
    s_start(5, 4) = 1; s_start(4, 5) = 1;

    eoe = false;
    s = s_start;
    player = 1;

    while (eoe == false)
        if (player == 1)
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 1000, 4, 2, 1), player, 1);
        else
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 1000, 4, 2, 2), player, 1);
        end
    end
    rtot41 = rtot41 + r;
end
parfor i = 1:50
    s_start = zeros(8);
    s_start(4, 4) = 2; s_start(5, 5) = 2;
    s_start(5, 4) = 1; s_start(4, 5) = 1;

    eoe = false;
    s = s_start;
    player = 1;

    while (eoe == false)
        if (player == 2)
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 1000, 4, 2, 1), player, 1);
        else
            [ s, r, eoe, ~, player ]= doAction(s, uct2(s, player, 1000, 4, 2, 2), player, 1);
        end
    end
    rtot42 = rtot42 + r;
end
toc;
save('stat4')