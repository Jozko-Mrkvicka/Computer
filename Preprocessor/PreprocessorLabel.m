%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function takes an array of text strings as an input parameter
% and it converts each string to a pair of variables of that name.
% Two variables represent a pair of source/destination labels.
% The destination label is prefixed with an underscore character.
% All newly created variables are assigned with values composed
% of the label prefix and the label index to distinguish them
% from other source code symbols (these are only two symbols in entire
% source code which width is 16 bits, all other symbols are shorter).
% 
% For example label 'LOOP' in
% 
% Label = ...
% {
%     'ERROR'
%     'LOOP'
% };
% 
% will be transformed to two variables:
% 
%  LOOP = 0b1101000000000001 (source label)
% _LOOP = 0b1110000000000001 (destination label)
%           ^^^^           ^
%           ||||           |
%           prefix       index          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function LabelCount = PreprocessorLabel(Label)
    Definitions

    for (idx = 1 : size(Label))
        assignin('caller', 'idx',  idx);
        evalin('caller', [char(Label(idx)),'  = bitor(LABEL_SRC_PREFIX,  idx);']);
        evalin('caller', [char(Label(idx)),'_ = bitor(LABEL_DEST_PREFIX, idx);']);
    end

    LabelCount = idx;
end
