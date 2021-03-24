function [meanclusters] = UpdateMeans(imArray,k,clusters)
%UpdateMeans function finds the average values of the RGB values of the the
%pixels in the image array according to which cluster the pixels are
%assigned to.
%Inputs: imArray = 3D array representing pixels of an image
%        k = single value for the number of clusters
%        clusters = 2D array containing cluster numbers for each
%                   corresponding pixel
%Outputs: meanclusters = 3D array with 1 column (so that row values =
%                        cluster no.s) which contains the mean RGB values
%                        for each cluster
%Author: Raymond Chiu

%Preallocate output for performance
meanclusters = zeros(k,1,3);

%create 2D arrays for each colour to extract values for each cluster number
R = imArray(:,:,1); %red
G = imArray(:,:,2); %green
B = imArray(:,:,3); %blue

for i = 1:k
    %CC (current cluster) is a logical array which finds which values in
    %the 2D array 'clusters' matches the current cluster number of the
    %loop.
    CC = clusters == i;
    
    %Using CC, I can find the current cluster's colour values from
    %imarray/ R G B by using the indexes of the current cluster.
    %This method of locating values was found on :
    %https://au.mathworks.com/help/matlab/matlab_prog/find-array-elements-that-meet-a-condition.html
    %simultaneously, we can also find the means of these values and store
    %them into output array 'meanclusters' per colour/layer.
    meanclusters(i,1,1) = mean(R(CC));
    meanclusters(i,1,2) = mean(G(CC));
    meanclusters(i,1,3) = mean(B(CC));
end

end

