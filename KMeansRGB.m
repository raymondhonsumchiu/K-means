function [Clust,Means] = KMeansRGB(imarray,Seed,N)
%KmeansRGB function takes an initial set of k means, assigning them to
%clusters and then proceeds to alternate between assigning clusters to
%closest means and calculating new updated means until the means found in
%the update step are the same as the previous set (convergence).
%Once converged, the means and cluster information will be outputted.
%If convergence is not reached after max iterations, then the current set
%of values will be used instead.
%Inputs: imarray = 3D array representing image pixels and their RGB values.
%        Sarray = 3D k x 1 x 3 array containing the seed mean values to
%                 initialise the KMeans process.
%        N = maximum number of desired iterations
%Outputs: Clusters = 2D array of cluster numbers and their pixel locations.
%         Means = 3D r x 1 x 3 array containing mean RGB values for each
%                 cluster, with the 'r' representing the cluster numbers.
%Author: Raymond Chiu

%Assign the clusters and update the seed means separately first
C = AssignToClusters(imarray,Seed);
n = max(C(:)); %need largest cluster value/no. of clusters for UpdateMeans function
M = UpdateMeans(imarray,n,C);

%For loop up to N-1 (as we already did first step) to iterate the rest of
%the necessary times
for i = 1:(N-1)
    
    %Save previous updated means for comparison
    M1 = M;
    %proceed to recalculate M and C
    C = AssignToClusters(imarray,M);
    M = UpdateMeans(imarray,n,C);
    
    %keep count for cases when max iterations is met
    Count = i;
    
    %need to use all() twice to find if all meets conditions as using all()
    %on a 2D array will only check the columns thus using all() twice, the
    %whole 2D array is checked.
    if all(all(M1 == M))
        %If new means = previous means then exit loop using break
        break
    end
    
    %when max iterations is met, display warning message
    if Count == (N-1)
        disp('Maximum number of iterations has been reached before convergence was achieved');
    end
end

%latest sets of arrays will be set as outputs (whether they're properly
%iterated or if the max has been reached)
Means = M;
Clust = C;

end

