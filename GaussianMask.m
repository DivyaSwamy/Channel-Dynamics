% March 29th 2018 @ DS
% Generate a gaussian mask. 
% 
function[gaussian_mask]= GaussianMask(number_of_neighbours,zigma)

   gaussian_mask = zeros(number_of_neighbours,number_of_neighbours);
   
    xo = 0; yo =0;
    if number_of_neighbours == 3
        x_nn = [xo-1 xo xo+1]; y_nn = [yo-1 yo yo+1];
    elseif number_of_neighbours ==5        
        x_nn = [xo-2 xo-1 xo xo+1 xo+2];
        y_nn = [yo-2 yo-1 yo yo+1 yo+2];
    else
        errdlg('choose b/w 3 or 5; number of neighbours incorrect')
    end
    for xcor = 1:length(x_nn)
        for ycor = 1:length(y_nn)
            gaussian_mask(ycor,xcor) =  exp( -(x_nn(xcor)-xo).^2/(2*zigma^2)...
                - (y_nn(ycor)-yo).^2/(2*zigma^2) );
        end
    end
 
    return 
end