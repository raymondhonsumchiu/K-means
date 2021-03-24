function [RGBs] = GetRGBValuesForPoints(imArray,CO)
%GetRGBValuesForPoints function uses locations from the 'CO' 2D array
%on the 3D array 'imArray' to obtain RGB values from said points. These
%values will then be placed within a list 'RGBs'.
%Inputs: imArray = 3D array from which we want to obtain color values
%        CO = 2D array of co-ordinates of points from 'colorarray'
%                   which we desire RGB values
%Outputs: RGBs = 3D array of extracted colour values
%Author: Raymond Chiu

%obtain no. of rows from 'CO' as that is equal to the number of
%co-ordinates
[rows,~] = size(CO);
%preallocate output array for better performance
RGBs = zeros(rows,1,3);

%Obtain and store values, point by point using a for loop
for i = 1:rows
    %extract co-ordinates for point 'i'
    Y = CO(i,1);
    X = CO(i,2);
    %obtain and store RGB values for selected point
    RGBs(i,1,:) = imArray(Y,X,:);
end

end

