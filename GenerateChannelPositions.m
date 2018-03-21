function [x,y] = GenerateChannelPositions(my,mx,num_channels)
% INPUT - image dimensions my and mx & num_channels to place in the image stack
% OUTPUT - channel positions in [x y]
%
x = ceil(mx*rand(1,num_channels)); y = ceil(my*rand(1,num_channels));

% Delete channels on image boundaries.
    y (x ==1)=[]; x(x ==1)=[];
    y (x ==mx)=[]; x(x ==mx)=[];
    x(y ==1 )= []; y(y ==1)=[];
    x(y ==my)= []; y(y ==my)=[];

return

end

