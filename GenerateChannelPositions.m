function [x,y] = GenerateChannelPositions(my,mx,num_channels)
% Random Channel positions
x = ceil(mx*rand(1,num_channels)); y = ceil(my*rand(1,num_channels));

% Delete channels on image boundaries.
    y (x ==1)=[]; x(x ==1)=[];
    y (x ==mx)=[]; x(x ==mx)=[];
    x(y ==1 )= []; y(y ==1)=[];
    x(y ==my)= []; y(y ==my)=[];

return

end

