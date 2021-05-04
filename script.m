sym_pair = [];
SF = 9;
SNR_db = [-38,-37,-36,-35.5,-35,-34.5,-34,-33.5,-33];
num_iter = 400 ;
error = zeros(size(SNR_db));
for j=0:size(SNR_db,2)-1
    sym_pair = [];
    snr_ratio = 10^(SNR_db(j+1)/10);
    for i=0:num_iter
       inp = [randi([0,2^SF-1],1,1)+1];
       [y,x] = modulate(inp,SF,snr_ratio);
        symb = demodulate(y,x);
        sym_pair = [sym_pair;[inp,symb]];
    end
    error(j+1) = sum(sym_pair(:,1)==sym_pair(:,2))/size(sym_pair,1);
    error(j+1) = 1-error(j+1);
end
plot(SNR_db,error);
title('BER for SF=9');
xlabel('SNR (db)');
ylabel('error probability');