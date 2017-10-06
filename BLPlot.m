function [] = BLPlot(Mag, Height, UnitChoice)
%Boundary Layer Plot
semilogy(Mag, Height);
title('Boundary Layer Plot')
switch UnitChoice
    case 1
        xlabel('Wind Speed, m/s')
        ylabel('Height, m')
    case 2
        xlabel('Wind Speed, mph')
        ylabel('Height, ft')
end
end

