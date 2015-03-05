classdef FileIterator < each.iterators.Iterable
%FILEITERATOR Files Iterator
% Iterator for looping over each file in a directory
%
% Example, a standard FOR loop:
%
%     for i = X
%         ...% Loop Body
%     end
%
% We can think of it as the equivalent loop:
%
%     sz = size(X);
%     numLoops = prod([sz(2:end)]);
%     for k = 1:numLoops
%         i = X(:,k);
%         ...% Loop Body
%     end
%
% This iterator is returned by a helper function, in this case EACH.
% This allows the following call:
%
%     for elem = each(A)
%         ...% Loop Body
%     end
%
% to behave like:
%
%     for k = 1:numel(A)
%         elem = A(k);
%         ...% Loop Body
%     end
%
% FileIterator Methods:
%   each.iterators.FileIterator/FileIterator - Constructor for a file
%                                                iterator
%   each.iterators.FileIterator/GETVALUE      - Get the Kth value of an 
%                                                iterator object.
%
% FileIterator Properties:
%   each.iterators.FileIterator.NumberOfIterations - The number of 
%                                                     iterations.
%
% Note: This iterator only works with objects which can be indexed into
%       by linear indexing.
%
% See Also: each, eachTuple, each.iterators.Iterable, 
%   each.iterators.TupleIterator
%

%   Copyright 2014 The MathWorks, Inc.

    properties (Access = private)
        Array;
    end
    
    methods
        function obj = FileIterator(directory, extension)
            %obj.Array = directory;
            files = dir([directory extension]);
            obj.Array = {files.name};
            obj.NumberOfIterations = numel(obj.Array);
        end
        
        function elem = getValue(obj, k)
            elem = obj.Array{k};
        end
        
    end
    
end