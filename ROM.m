clc
% Load symbolic constants (instructions)
% Instructions
% Addresses
% Video_Adapter
% CharTable

% ROM code definition
RomCode =                        ...
[
	% bin2dec('0000 0100')	55  %MRC   r1    55
	% bin2dec('0001 1001')	00  %MRR   r2    r1
	% bin2dec('0101 0001')	16  %MMRI  a(16) r1
	% bin2dec('0011 1100')	16  %MRMI  r3    a(16)

%===
	% bin2dec('0000 0000')	55  %MRC   r0    55
	% bin2dec('0000 1000')	44  %MRC   r2    44
	% bin2dec('0101 0000')	16  %MMRI  a(16) r0
	% bin2dec('0000 0000')	16  %MRC   r0    a(16)

	% bin2dec('0010 0100')	00  %MRM   r1    a(r0)
	% bin2dec('0100 0010')	00  %MMR   a(r0) r2

%===
	% bin2dec('0000 0000')	7  %MRC   r0    7
	% bin2dec('0000 0100')	4  %MRC   r1    4
	% bin2dec('1111 0001')	0  %ADD   r0    r1
	% bin2dec('1110 0000')	1  %ADI   r0    1	
%===

	% bin2dec('0011 0000')	16  %MRC   r0    51
	% bin2dec('0011 0001')	17  %MRC   r1    52
	% bin2dec('0011 0010')	18  %MRC   r2    53
	% bin2dec('0011 0011')	19  %MRC   r3    54

	% bin2dec('0001 0011')	00  %MRR   r0    r3
	% bin2dec('0001 0111')	00  %MRR   r1    r3
	% bin2dec('0001 1011')	00  %MRR   r2    r3
	% bin2dec('0001 1111')	00  %MRR   r3    r3

%===
	% bin2dec('0000 0000')   16  %MRC   r0    16
	% bin2dec('0000 0100')   18  %MRC   r1    18
	% bin2dec('0000 1000')  255  %MRC   r2   255

	% bin2dec('0100 0010')    0  %MMR   a(r0) r2
	% bin2dec('1110 0000')    1  %ADI   r0    1
	% bin2dec('0111 0001')    6  %JNE   r0    r1	 6
%===

%===
	% bin2dec('0000 0000')   10  %MRC   r0    10
		
	% bin2dec('1000 0001')    0  %TMR   r0    r1
	% bin2dec('1110 0000')    1  %ADI   r0    1
	% bin2dec('1110 0100')    1  %ADI   r1    1
	% bin2dec('0110 0000')    2  %JPE   r0    r0	 2

	% N A 
	% Z D 
	% A R
%===
	% bin2dec('0000 0000')    C  %MRC   r0    C
	% bin2dec('1001 0001')    0  %TRR   r0    r1

	% bin2dec('0000 0000')    A  %MRC   r0    A
	% bin2dec('0000 0100')    1  %MRC   r1    1
	% bin2dec('1001 0001')    0  %TRR   r0    r1

	% bin2dec('0000 0000')    U  %MRC   r0    U
	% bin2dec('0000 0100')    2  %MRC   r1    2
	% bin2dec('1001 0001')    0  %TRR   r0    r1
%===

	bin2dec('1010 0000')    A  %TIR   A    r0

	bin2dec('0000 0000')    1  %MRC   r0    1
	bin2dec('1010 0000')    H  %TIR   H    r0

	bin2dec('0000 0000')    2  %MRC   r0    2
	bin2dec('1010 0000')    O  %TIR   O    r0

	bin2dec('0000 0000')    3  %MRC   r0    3
	bin2dec('1010 0000')    J  %TIR   J    r0
%===

	00  00
	00	00
	00  00
	00  00

]

  % TPR   a(10) a(REG_A)

RomCode = reshape(transpose(RomCode), [], 1)
% RomCode = Preprocessor(RomCode)

