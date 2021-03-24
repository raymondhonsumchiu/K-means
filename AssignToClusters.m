function [Cluster] = AssignToClusters(imArray,means)
%AssignToCluster function assigns each pixel from an image ('imArray') to a
%cluster number based on which mean from 'means' the pixel's squared
%distance value is closest to.
%Inputs: imArray = 3D array containing all the pixel/RGB values for an
%                  image
%        means = 3D array containing 'k' (rows) amount of means and their
%                RGB values
%Outputs: Cluster = 2D array of assigned cluster numbers for each image pixel
%Author: Raymond Chiu

%Obtain dimensions of input arrays for use in the loop
[Row,~,~] = size(means);
[r,c,~] = size(imArray);

%Preallocate 'SD' array for performance
SD = zeros(r,c,Row);

%also set up variable per layer of image array for use when vectorising
%for the squared distances
R = imArray(:,:,1);
G = imArray(:,:,2);
B = imArray(:,:,3);

%use for loop to fill in the 3D array 'SD' which will have each layer
%representing a different cluster.
for i = 1:Row
    %Create a 1x1x3 array M with each layer containing one mean value
    %thus each loop will find the squared distance for one cluster at a time
    M = means(i,1,[1,2,3]);
    
    %Find the squared distances using vectorisation by using layers of
    %imArray (A,B,C) values of the corresponding cluster's means.
    %Store the outputs into array 'SD' with each layer representing
    %the squared distance of their respective cluster
    %Didn't use squareddistance function to avoid call times thus speeding
    %up code.
    %store 2D array answer in corresponding layer/cluster.
    SD(:,:,i) = (R - M(:,:,1)).^2 + (G - M(:,:,2)).^2 + (B - M(:,:,3)).^2;
    
end

%reshape the 3D 'SD' array into the 2D array 'comp' which will be used for
%comparison, so that each cluster/layer is a column in the array. Doing
%this makes it easier to compare minimum values and finding their indexes
%rather than dealing with 3D arrays.
comp = reshape(SD(:,:,:),[r*c,Row]);

%find the minumum values of the rows of 'comp' so that each pixels SDs are
%compared, while finding the index/column/cluster number of the minimum
%numbers
%note: in cases where the numbers being compared are equal, the min
%function automatically selects the first one, in this case the smaller
%index/cluster
[~,I] = min(comp,[],2);

%reshaping the indices ('I') into a r x c array will give me clusters as
%all the pixels will be assigned their individual cluster no.s
Cluster = reshape(I,[r,c]);

end

