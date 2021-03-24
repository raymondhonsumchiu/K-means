# K-means
This was my first ever software project, taught at The University of Auckland SE131 course as an assignment. In this project, uses the K-Means Algorithm to convert an image into another with k colours.

## Example:
|Example Image                |12 Colour Image                  |
|:---------------------------:|:-------------------------------:|
|![example](example.jpg)      |![example12](12colourexample.jpg)|

|6 Colour Image                |3 Colour Image                  |
|:---------------------------:|:-------------------------------:|
|![example](6colourexample.jpg)      |![example12](3colourexample.jpg)|

## Methodology
Firstly an initial set of K means is selected at random. Then the algorithm proceeds to alternate between the following two steps:
1. **Assignment**: every datapoint is assigned to a cluster based on whichever means it is closest to
2. **Update**: for each cluster, new means are calculated from all the points in said cluster.

These steps are repeated until no more changes occur, at this point the algorithm has converged and the image is produced.

