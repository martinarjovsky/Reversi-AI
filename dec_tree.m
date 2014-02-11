classdef dec_tree < handle
    %Arbol de decisiones para UCT
    %   Detailed explanation goes here
    
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

