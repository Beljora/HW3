clear, clc;
FilePath = input('Enter Raw Voltage time history file path: ','s');
RawData = csvread(FilePath);
UnitChoice = input('Enter 1 for m/s or 2 for mph: ');
[U,V] = THUnitConv(UnitChoice, RawData);
[Mag,Dir] = ResWindSpeed(U, V);
disp('Resultant Wind Speeds');
disp('=====================');
switch UnitChoice
    case 1
        disp('  Magnitude (m/s) || Direction (deg)');
        Height = [0.9, 2.44, 3.96, 10.0, 16.8, 47.2, 74.7, 116, 158, 200];
    case 2
        disp('  Magnitude (mph) || Direction (deg)');
        Height = [3, 8, 13, 33, 55, 155, 245, 382, 519, 656];
end
[nMax,nMax] = size(Mag);
for n = 1:nMax
    Dir(n) = Dir(n)*180/pi;
    fprintf('%2i.  %10.2f   || %10.2f\n', n, Mag(n), Dir(n));
    THMatrix(n,1) = Height(n);
    THMatrix(n,2) = Mag(n);
    THMatrix(n,3) = Dir(n);
end
BLPlot(Mag, Height, UnitChoice);
FilePath = input('Enter Processed Time History File output path: ','s');
csvwrite(FilePath,THMatrix);

