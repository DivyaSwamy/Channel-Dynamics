function [img_ch]=PlaceChannels(img,x,y,index,mask,amplitude,tau_op,...
    tau_cl,tstp,total_time)
% March 21st 2018 @ DS
% INPUT - img stack, channel positions, gaussian mask, 
% amplitude of channel openings and channel properties.
% OUTPUT- an img stack with channels embedded at specified locations.

img_ch = img;

for jk= 1:length(x)
    proxy(1,:)=img_ch(y(jk),x(jk),index);
    [ch, ~, ~]= GenerateChannelTrace(tau_op,tau_cl,tstp,total_time);
    tr(1,:)=(amplitude*std(proxy))*ch(1,index);
    ch_mask = zeros(3,3,length(index));
    for ik = 1:length(index)
        ch_mask(:,:,ik)= tr(1,ik).*mask;
    end
    img_ch(y(jk)-1:y(jk)+1,x(jk)-1:x(jk)+1,index)=...
        img_ch(y(jk)-1:y(jk)+1,x(jk)-1:x(jk)+1,index)+ch_mask;
end

return
end

