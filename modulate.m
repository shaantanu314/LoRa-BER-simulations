function [y,x] = modulate(inp,sf,snr) ;

SF = sf ;
N = 2^SF ;
B =  125000;
fs = B ;

x = zeros(N,N) ;

for s = 0:N-1
	
	n_fold = N - s ;
	
	for k = 0:n_fold-1
		x(s+1,k+1) = exp(1j*2*pi*( (k*k)/(2*N) + k*( s/N - 1/2 ) )) ;
	end
	for k = n_fold:N-1
		x(s+1,k+1) = exp(1j*2*pi*( (k*k)/(2*N) + k*( s/N - 3/2 ) )) ;
    end
    
end

SNR = snr;
N0 = 1/SNR;
sigma_sq = N0/(2*N) ;

h = 1;
y = zeros(size(inp,2),N);
for i=0:size(inp,2)-1
    z = sigma_sq*randn(1,N) ;
    y(i+1,:) = h*x(inp(i+1),:) +z;
end

end