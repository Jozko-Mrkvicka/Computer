function Test_Logic_Operations()
	V1_Data2 =    [0 0 1 1 0 0 1 1];
	V1_Data1 =    [0 1 0 1 0 1 0 1];
	V1_Data0 =    [0 0 0 0 1 1 1 1];
	V1_Input =    [0; V2_Data2; V1_Data1; V1_Data0];
	V1_Expected = [0 1 1 ];

	% V2_Data1 =    [bin2dec('0 0 0 0 0 1 1 1')];
	% V2_Data0 =    [bin2dec('1 1 1 0 0 0 0 0')];
	% V2_Input =    [0; V2_Data1; V2_Data0];
	% V2_Expected = [bin2dec('1 1 1 0 0 1 1 1')];

	% V3_Data1 =    [bin2dec('0 0 0 0 0 1 1 1')];
	% V3_Data0 =    [bin2dec('1 0 1 0 0 1 1 0')];
	% V3_Input =    [0; V3_Data1; V3_Data0];
	% V3_Expected = [bin2dec('1 0 1 0 0 0 0 1')];

	% V4_Data =     [bin2dec('1 0 1 0 0 1 1 0')];
	% V4_Input =    [0; V4_Data];
	% V4_Expected = [bin2dec('0 1 0 1 1 0 0 1')];


	test('Test_Logic_Operation_Bitwise_AND', V1_Input, V1_Expected);
	% test('Test_Logic_Operation_Bitwise_OR',  V2_Input, V2_Expected);
	% test('Test_Logic_Operation_Bitwise_XOR', V3_Input, V3_Expected);
	% test('Test_Logic_Operation_Bitwise_NOT', V4_Input, V4_Expected);
end

