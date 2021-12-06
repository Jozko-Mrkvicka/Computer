function Test_Arithmetic_Operations()

	% Test Bit Adder.
	V1_DataIn_2 =   [0 0 1 1 0 0 1 1];                                               % Data A in.
	V1_DataIn_1 =   [0 1 0 1 0 1 0 1];                                               % Data B in.
	V1_DataIn_0 =   [0 0 0 0 1 1 1 1];                                               % Carry in.
	V1_Input    =   [0:7; V1_DataIn_2; V1_DataIn_1; V1_DataIn_0];                    % First vector is a time vector.

	V1_Expected_1 = [0 1 1 0 1 0 0 1];                                               % Expected Data out.
	V1_Expected_0 = [0 0 0 1 0 1 1 1];                                               % Expected Carry out.

	test('Test_Arithmetic_Operation_Bit_Adder_Data_Out',  V1_Input, V1_Expected_1);  % Test Data output.
	test('Test_Arithmetic_Operation_Bit_Adder_Carry_Out', V1_Input, V1_Expected_0);  % Test Carry bit output.


	% Test Word Adder.
	V1_DataIn_1 =   [0 25 54 65534 65535 65535 65535];                                % Data A in.
	V1_DataIn_0 =   [0  1 36     1     1 65534 65535];                                % Data B in.
	V1_Input    =   [0:6; V1_DataIn_1; V1_DataIn_0];                                  % First vector is a time vector.

	V1_Expected_1 = [0 26 90 65535     0 65533 65534];                                % Expected Data out.
	V1_Expected_0 = [0  0  0     0     1     1     1];                                % Expected Carry out.

	test('Test_Arithmetic_Operation_Word_Adder_Data_Out',  V1_Input, V1_Expected_1);  % Test Data output.
	test('Test_Arithmetic_Operation_Word_Adder_Carry_Out', V1_Input, V1_Expected_0);  % Test Carry bit output.



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


	% test('Test_Logic_Operation_Bitwise_AND', V1_Input, V1_Expected);
	% test('Test_Logic_Operation_Bitwise_OR',  V2_Input, V2_Expected);
	% test('Test_Logic_Operation_Bitwise_XOR', V3_Input, V3_Expected);
	% test('Test_Logic_Operation_Bitwise_NOT', V4_Input, V4_Expected);
end

