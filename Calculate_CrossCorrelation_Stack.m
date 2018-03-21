function [CC_Mat] = Calculate_CrossCorrelation_Stack(Stack,frames,lag)
% Jan 26 2018 @ DS
% Take in a 3D stack and return cross correlated matrix.
% Input: Stack - the input 3D stack typically raw fluorescence
%        frames - how many frames make up a single time subsection
%        lAGS:- lags over which cross correlation is calculated. 
% OUTPUT: is 3D cross correlation matrix CC_Mat

outersections = floor(size(Stack,3)./frames);
my=size(Stack,1); mx=size(Stack,2);
matrix_cc_25= zeros(my,mx,outersections);
matrix_cc_50 = zeros(my,mx,outersections);
CC_Mat=zeros(my,mx,outersections);

    p1=1;
    for ol=1:outersections
        A(1:my,1:mx,1:frames)= Stack(:,:,p1:p1+frames-1);
        
        % Compute nn cross correlations
        
        for j=2:my-1
            for i =2:mx-1
                count=0; index=0; ff=zeros(9,frames);
                z = zeros(8,2*frames-1);
                % Subtract mean from each block of pixel and nearest
                % neighbor.
                for k1=-1:1
                    for k2=-1:1
                        count=count+1;
                        mm=mean(A(j+k1,i+k2,:));
                        ff(count,:)=A(j+k1,i+k2,:)-mm;
                    end
                end
                % Trace of center pixel
                cpx= ff(5,:);
                for kk=1:count
                    if (kk ~= 5)
                        index=index+1;
                        % consider neighboring pixels.
                        npx = ff(kk,:);
                        z(index,:)=xcorr(cpx,npx,'coeff');
                    end
                end
                % sum calculated cc upto lag
                array=frames:frames+lag;
                proxy=sum(sum(z(1:index,array),1)); proxy=proxy./8;
                matrix_cc_25(j,i,ol)=proxy;
                array=frames:frames+2*lag;
                proxy= sum(sum(z(1:index,array),1)); proxy = proxy./8;
                matrix_cc_50(j,i,ol)= proxy;
                % Think about this once more
                CC_Mat(j,i,ol)= 2*matrix_cc_25(j,i,ol)-matrix_cc_50(j,i,ol);
                
                clear z ff proxy
            end
        end
        
        p1 = p1+frames;
        
        disp(p1)
        
    end 
                
                
              
return
end

