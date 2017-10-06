function [Mag, Dir] = ResWindSpeed(U, V)
%Resultant Wind Speed Calculation
[nRow, nCol] = size(U);
for col = 1:nCol
    UAvg(col) = 0;
    VAvg(col) = 0;
    for row = 1:nRow
        UAvg(col) = UAvg(col)+U(row,col);
        VAvg(col) = VAvg(col)+V(row,col);
    end
    UAvg(col) = UAvg(col)/nRow;
    VAvg(col) = VAvg(col)/nRow;
end
    [Dir, Mag] = cart2pol(UAvg,VAvg);
end

