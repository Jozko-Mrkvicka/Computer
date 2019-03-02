function Test_Bit_Demultiplexers()
	V1_Address =  [0 1 0 1];
	V1_Data =     [0 0 1 1];
	V1_Input =    [0:3; V1_Address; V1_Data];
	V1_Expected = [0 0 1 2];

	V2_Address =  [0 1 2 3 0 1 2 3];
	V2_Data =     [0 0 0 0 1 1 1 1];
	V2_Input =    [0:7; V2_Address; V2_Data];
	V2_Expected = [0 0 0 0 1 2 4 8];

	V3_Address =  [0 1 2 3 4 5 6 7 0 1 2 3 4  5  6  7];
	V3_Data =     [0 0 0 0 0 0 0 0 1 1 1 1 1  1  1  1];
	V3_Input =    [0:15; V3_Address; V3_Data];
	V3_Expected = [0 0 0 0 0 0 0 0 1 2 4 8 16 32 64 128];


	test('Test_Bit_Demultiplexer_1_to_2', V1_Input, V1_Expected);
	test('Test_Bit_Demultiplexer_1_to_4', V2_Input, V2_Expected);
	test('Test_Bit_Demultiplexer_1_to_8', V3_Input, V3_Expected);
end

