function [img]= GenerateStack(my,mx,total_frames,baseline_level)

img = baseline_level+10*rand(my,mx,total_frames);

%
% Generate sigmoid function to mimick increase in baseline post IP3
% release.
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

