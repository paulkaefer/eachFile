function IO = eachFile(directory, extension)
% EACHFILE Loop over each file in a directory
% Use EACHFILE(directory, extension) to iterate over each row in an array.
%    
%    for file = EACHFILE(directory, extension)
%        ...
%    end
%
% In each iteration, file is the next file.
% extension is optional; by default this will iterate through every file in
% the directory. Optionally pass '*.csv' or '*.txt' or the like.
% 
%  See also each, cell/each, eachColumn, eachPage, eachSlice

%   Copyright 2014 The MathWorks, Inc.

if ~exist('extension', 'var')
    extension = '*';
end

IO = each.iterators.FileIterator(directory, extension);
end