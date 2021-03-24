function [RA] = SelectKRandomPoints(A,k)
%SelectKRandomPoints selects 'k' amount of random pixels from the
%inputted 3D array and then proceeds to store the pixel co-ordinates in a
%2D array.
%Inputs: A = The 3D array which you wish to obtain random pixels from
%        k = number of desired random pixels from 'array'
%Outputs: RA = The 2D array output which will store the locations
%                       of the randomly selected pixels.
%Author: Raymond Chiu

%obtain dimensions of 3D array to use in loops and for finding randomised
%values
%also used ~ to represent unused variables
[rows,cols,~] = size(A);



%use for loop to obtain 'k' random values
for i = 1:k
    %find random pixel co-ordinates:
    %by adding 1 to the size of the rows and cols after multiplying with
    %the rand function, we can avoid the rare case of obtaining 0 for
    %either case as 0 isn't an array index
    %also, using floor instead of the round function prevents us from
    %rounding up to an index value above the dimensions of 'array'
    R = floor(rows*rand + 1);
    C = floor(cols *rand +1 );
    
    %Store these pixel co-ordinates,
    RA(i,:) = [R,C];
    %Do not want to preallocate RA due to my use of the unique function
    %when checking.
    
    %when possible, check if there are any duplicate rows using the
    %'unique' function which I discovered from
    %https://www.mathworks.com/matlabcentral/answers/373747-find-unique-in-matrix-of-x-y-coordinates
    %also set boolean variable 'checking' as true for use in while loop as
    %the condition.
    checking = 1;
    if i>1 %makes it so checking doesn't occur when only one set exists
        
        %use a while loop to check/replace pixel until a unique one is
        %confirmed
        while checking
            %unique will remove any duplicate rows so if the new pixel
            %isn't a duplicate, the number of rows shall remain unchanged,
            %also, 'stable' will keep the compared arrays in the same order
            %as before (not necessary but just to avoid confusion).
            Sarray = size(RA);
            Sunique = size(unique(RA,'rows','stable'));
            
            test = Sarray == Sunique;
            %creates a 2D logical array from comparing 'RA'before and after
            %using unique function on it
            
            if test(1) == 1  %testing(1) is the results of comparing rows
                %rows length unchanged, thus new pixel is unique
                checking = 0;
            else
                %when the new pixel is a duplicate, it will be replaced and
                %then tested non-stop until a new unique pixel is selected
                R = floor(rows*rand + 1);
                C = floor(cols *rand + 1);
                RA(i,:) = [R,C];
            end
        end
    end
    
end

end

