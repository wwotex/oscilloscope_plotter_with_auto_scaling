function [scaled_data, prefix] = scale_data(data, varargin)
% SCALE_DATA Scales the input data to an appropriate metric prefix.
%   [scaled_data, prefix] = scale_data(data) scales the input data to an
%   appropriate metric prefix and returns the scaled data and the
%   corresponding prefix symbol.
%
%   [scaled_data, prefix] = scale_data(data, min_val, max_val) scales the
%   input data to an appropriate metric prefix based on the specified
%   minimum and maximum values and returns the scaled data and the
%   corresponding prefix symbol.
%
%   Example:
%   >> data = [0.00005, 0.0021, 1.4, 7800];
%   >> [scaled_data, prefix] = scale_data(data)
%   scaled_data =
%       50.0000   2100.0000   1.4000   7.8000
%   prefix =
%       'm'

% Determine minimum and maximum values in data
if nargin < 2
    min_val = min(data);
    max_val = max(data);
else
    min_val = varargin{1};
    max_val = varargin{2};
end

% Determine appropriate prefix for data
data_range = max_val - min_val;
if data_range > 1e9
    prefix = 'G';
    scale_factor = 1e-9;
elseif data_range > 1e6
    prefix = 'M';
    scale_factor = 1e-6;
elseif data_range > 1e3
    prefix = 'k';
    scale_factor = 1e-3;
elseif data_range > 1
    prefix = '';
    scale_factor = 1;
elseif data_range > 1e-3
    prefix = 'm';
    scale_factor = 1e3;
elseif data_range > 1e-6
    prefix = '$\mu$';
    scale_factor = 1e6;
elseif data_range > 1e-9
    prefix = 'n';
    scale_factor = 1e9;
elseif data_range > 1e-12
    prefix = 'p';
    scale_factor = 1e12;
elseif data_range > 1e-15
    prefix = 'f';
    scale_factor = 1e15;
elseif data_range > 1e-18
    prefix = 'a';
    scale_factor = 1e18;
else
    prefix = 'z';
    scale_factor = 1e21;
end

% Scale data
scaled_data = data * scale_factor;
end