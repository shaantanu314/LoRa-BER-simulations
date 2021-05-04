function [symb] = demodulate(y,x) ;
	
	N = size(y,2) ;
	
	X = zeros(N,1) ;
    symb = zeros(size(y,1),1);
	for i = 1:size(y,1)
        for k = 0:N-1

            for n = 0:N-1
                X(k+1,1) = X(k+1,1) + y(i,n+1)*conj(x(k+1,n+1));
            end			

        end

        [~,ind] = max(abs(X)) ;

        symb(i) = ind  ;
        
    end
	
end