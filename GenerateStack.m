function [img]= GenerateStack(my,mx,total_frames,baseline_level)
% March 21st 2018 @ DS
% INPUT: img dimensions my,mx,total_frames and baseline_level
% OUTPUT : generated 3D image stack with sigmoid funtcion inserted
% to mimick rise of calcium once IP3 is injected.

img = baseline_level+10*rand(my,mx,total_frames);

%
% Generate sigmoid function to mimick increase in baseline post IP3
% release. Numerator of y denotes the increase that the baseline will undergo
%  once sigmoid is added. The shape of the sigmoid is controlled by the coefficent of the 
% exponentia, i.e. 0.5 and peak values will be reached by frame 800.
% These 3 variables can be changed if you want a different rate of rise etc.
%
y = zeros(1,total_frames);
for jk=1:total_frames
    y(jk)= 100./(1+exp(-0.05*(jk-800)));
end

% Add sigmoid to the random image stack

for jk=1:my
    for ik=1:mx
        pr(1,:)=img(jk,ik,:);
        img(jk,ik,:)= pr(1,:)+y(1,:);
    end
end

return
end

