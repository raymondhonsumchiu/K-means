function [Kimage] = CreateKColourImage(Clusts,Means)
%CreateKColourImage creates an image with its pixels divided into k
%clusters, with all pixels within a cluster having it's own singular 'mean'
%colour.
%Inputs: Clusters = 2D array of cluster numbers and their pixel locations.
%        Means =  3D r x 1 x 3 array containing mean RGB values for each
%                 cluster, with the 'r' representing the cluster numbers.
%Outputs: Kimage = 3D array of unsigned 8bit integers representing an
%                  image, the colours of the pixels depending on their
%                  assigned cluster.
%Author: Raymond Chiu

%find number of clusters (rows in 'Means')
k = length(Means);

%preallocate Kimage for performance, it will have the same 2D dimensions as
%Clusts
[rows,cols] = size(Clusts);
Kimage = zeros(rows,cols,3);

%Use for loop to fill in colours for Kimage one cluster at a time
for i = 1:k
    %find co-ordinates of all cluster 'i' values
    [R,C] = find(Clusts == i);
    %find the number of pixels in the cluster to use in for loop
    L = length(R);
    
    %use nested for loop to assign mean colours to all chosen pixels of the
    %loop.
    for j = 1:L
        %fill in assigned mean colours for cluster 'i'
        Kimage(R(j),C(j),:) = Means(i,1,:);
    end
    
end

%convert Kimage from a doubles array to an 8bit so image is displayed
%correctly
Kimage = uint8(Kimage);


end

