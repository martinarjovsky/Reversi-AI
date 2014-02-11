clear all
clear function

M = evalin('base','inmem')

for i = 1:length(M)
   A = M{i}
if mislocked(A)
munlock(A)
end

end

clear all
clear function
clc
