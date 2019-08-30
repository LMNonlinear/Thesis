function J = TCfunc_new(x,PHI,Y,n,v_coords,u_coords)

c1 = x(1);
lambda1 = x(2);
noise_std = x(3);

P = zeros(n);
for j = 1:n
    for k = 1:n
        P(j,k) = c1*lambda1^(max([j k]));
    end
end

%P = P + 0.001*P(1)*eye(length(P));  
L = chol(P,'lower');
%form thin QR matrix
Rd = triu(qr([PHI' Y]));
Rd1 = Rd(1:n+1,1:end-1);
Rd2 = Rd(1:n+1,end);
R = triu(qr([Rd1*L Rd2; noise_std*eye(n) zeros(n,1)]));
R1 = R(1:n,1:n);
R2 = R(1:n,end);
r = R(n+1,n+1);
J = r^2/noise_std^2 + (length(Y)-n)*log(noise_std^2)+2*sum(log(abs(diag(R1))));

end