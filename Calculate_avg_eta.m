function  [array_eta_baseline,array_eta_signal]= Calculate_avg_eta(CC_Mat,x,y)
% March 21 @ DS
array_eta_baseline=[]; array_eta_signal= [];

CC_Mat_baseline = CC_Mat(:,:,1:3); CC_Mat_Signal = CC_Mat(:,:,6:end);

for jk = 1:length(x)
        indexx = x(jk)-1:x(jk)+1;
        indexy = y(jk)-1:y(jk)+1;
        value1 = mean(CC_Mat_baseline(indexy,indexx,:),3);
        array_eta_baseline = cat(1,array_eta_baseline,mean(mean(value1)));
        value1 = mean(CC_Mat_Signal(indexy,indexx,:),3);
        array_eta_signal = cat(1,array_eta_signal,mean(mean(value1)));
 end
return
end

