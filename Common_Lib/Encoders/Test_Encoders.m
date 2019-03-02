function Test_Encoders()
	Input_V1 =    [0:3; 1 2 4 8];
	Expected_V1 =      [0 1 2 3];

	Input_V2 =    [0:7; 1 2 4 8 16 32 64 128];
	Expected_V2 =      [0 1 2 3  4  5  6   7];

	Input_V3 =    [0:15; 1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768];
	Expected_V3 =       [0 1 2 3  4  5  6   7   8   9   10   11   12   13    14    15];

	test('Test_Encoder_4_to_2',  Input_V1, Expected_V1);
	test('Test_Encoder_8_to_3',  Input_V2, Expected_V2);
	test('Test_Encoder_16_to_4', Input_V3, Expected_V3);
end

