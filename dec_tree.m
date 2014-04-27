classdef dec_tree < handle
    %Decission tree structure used by UCT
    
    properties
        children
        board
        player
        Q
        actions
        eoe
        parent
        n
        reward
    end
    
    methods
        function delete(obj)
           for i = 1:length(obj.children)
               delete(obj.children(i));
           end
        end
    end
    
end

