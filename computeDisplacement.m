function [mfd,ad] = computeDisplacement(ts)
% Compute mean framewise displacement (mfd) and absolute displacement (ad)
% from ts, which is an n x 6 matrix where the first 3 cols are movement in
% terms of roll, pitch, yaw (in rads) and the second 3 cols are
% translations in mm in x,y,z.

for i = 2:size(ts,1)
    fd(i-1,1) = ts(i-1,1)*50 - ts(i,1)*50;
    fd(i-1,2) = ts(i-1,2)*50 - ts(i,2)*50;
    fd(i-1,3) = ts(i-1,3)*50 - ts(i,3)*50;
    
    fd(i-1,4)=ts(i-1,4)-ts(i,4);
    fd(i-1,5)=ts(i-1,5)-ts(i,5);
    fd(i-1,6)=ts(i-1,6)-ts(i,6);
end

mfd = mean(sum(abs(fd),2));

ts(:,1:3) = ts(:,1:3).*50;
ad = max(abs(ts(:)));

