% Plots the learning curve of UCT. To do this, uncomment
% the lines mentioned in uct.m and add a breakpoint in  uct.m 
% right before the last end.

figure;
hold all;
for i = 1:size(Qplot, 2)
    plot(1:size(Qplot, 1), Qplot(:,i))
end
xlabel('Numero de simulacion');
ylabel('Q Values');
act_names = cell(size(start_node.actions));
for i = 1:length(start_node.actions);
    a = start_node.actions(i);
    if (mod(a, 8) == 0) % Vectorizes a
            am = [a/8; 8];
    else
            am = [floor(a/8)+1; mod(a, 8)];
    end
    act_names{i} = num2str(am');    
end

legend(act_names);