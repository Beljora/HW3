function [U,V] = THUnitConv(UnitChoice, RawData)
%Time History Unit Conversion
[nRow, nCol] = size(RawData);
switch UnitChoice
    case 1
        for row = 1:nRow
            for col = 1:nCol/2
                U(row,col) = RawData(row,col*2-1) / 4 * 80 - 40;
                V(row,col) = RawData(row,col*2) / 4 * 80 - 40;
            end
        end
    case 2
        for row = 1:nRow
            for col = 1:nCol/2
                U(row,col) = RawData(row,col*2-1) / 4 * 180 - 90;
                V(row,col) = RawData(row,col*2) / 4 * 180 - 90;
            end
        end
    otherwise
        warning('Invalid input');
end
end

