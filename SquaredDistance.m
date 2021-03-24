function [SD] = SquaredDistance(P,Q)
%SquaredDistance function takes 2 points in 3D space and finds the squared
%distance/the geometric straight line distance between the points using the
%formula SD = (P1 - Q1)^2 + (P2 - Q2)^2 + (P3 - Q3)^2
%Inputs: P = array (1D or 3D) containing 3 elements representing the first
%             point in 3D space
%        Q = array (1D or 3D) containing 3 elements representing the
%        second point in 3D space
%Outputs: SD = Squared distance between the 2 points
%Author: Raymond Chiu

%Note: this function only works with 3x1 , 1x3, 1x1x3 sized inputs.
%this is due to the way this function accesses the input arrays.

%when calculating the squared distances, the numbers from the inputs are
%accessed via: array(n) where n is the order of the number
%eg. a = [1;3;4]
%    a(2) = 3  as 3 is the 2nd no. in array a
%this works for all 3 of the types of requireed input sizes due to each
%only having 1 set of numbers in order.
%If the sizes/numbers were allocated within the array differently, then
%this method won't work. Instead the specific locations of the numbers
%would have to be called instead.
SD = (P(1) - Q(1))^2 + (P(2) - Q(2))^2 + (P(3) - Q(3))^2;


end

