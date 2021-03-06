function rgb = hsv2rgb2 (hsv)
H = hsv(:,:,1); 
S = hsv(:,:,2); 
V = hsv(:,:,3);

I = floor(6*H);
I(I==6) = 5;
F = 6*H-I;
P = V.*(1-S);
Q = V.*(1-F.*S);
T = V.*(1-(1-F).*S);
R = V.*(I==0 | I==5) +...
    P.*(I==2 | I==3) +...
    Q.*(I==1) + T.* (I==4);
G = V.*(I==1 | I==2) +...
    P.*(I==4 | I==5) +...
    Q.*(I==3) + T.* (I==0);
B = V.*(I==3 | I==4) +...
    P.*(I==0 | I==1) +...
    Q.*(I==5) + T.* (I==2);

rgb = cat(3,R,G,B);