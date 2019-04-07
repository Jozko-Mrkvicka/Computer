clc
% Load symbolic constants (instructions)
% Instructions
% Addresses
% Video_Adapter
% CharTable

% ROM code definition
RomCode =                        ...
[
	bin2dec('0000 0000')	51  %MRC   r0    51
	bin2dec('0000 0100')	52  %MRC   r1    52

	bin2dec('0011 0000')	16  %MMR   a(16) r0
	bin2dec('0011 0001')	17  %MMR   a(17) r1

	bin2dec('0010 1000')	16  %MRM   r2    a(16)
	bin2dec('0010 1100')	17  %MRM   r3    a(17)

	% bin2dec('0011 0000')	16  %MRC   r0    51
	% bin2dec('0011 0001')	17  %MRC   r1    52
	% bin2dec('0011 0010')	18  %MRC   r2    53
	% bin2dec('0011 0011')	19  %MRC   r3    54

	% bin2dec('0001 0011')	00  %MRR   r0    r3
	% bin2dec('0001 0111')	00  %MRR   r1    r3
	% bin2dec('0001 1011')	00  %MRR   r2    r3
	% bin2dec('0001 1111')	00  %MRR   r3    r3
	
	00  00
	00	00
	00  00
	00  00
]

  % TPR   a(10) a(REG_A)

RomCode = reshape(transpose(RomCode), [], 1)
% RomCode = Preprocessor(RomCode)

