figure;
hold all;
for i = 1:size(Qplot, 2)
    plot(1:size(Qplot, 1), Qplot(:,i))
end