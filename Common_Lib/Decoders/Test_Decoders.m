function Test_Encoders()
	Input_V1 =    [0:3; 0 1 2 3];
	Expected_V1 =      [1 2 4 8];

	Input_V2 =    [0:7; 0 1 2 3  4  5  6   7];
	Expected_V2 =      [1 2 4 8 16 32 64 128];

	Input_V3 =    [0:15; 0 1 2 3  4  5  6   7   8   9   10   11   12   13    14    15];
	Expected_V3 =       [1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768];

	test('Test_Decoder_2_to_4',  Input_V1, Expected_V1);
	test('Test_Decoder_3_to_8',  Input_V2, Expected_V2);
	test('Test_Decoder_4_to_16', Input_V3, Expected_V3);
end

