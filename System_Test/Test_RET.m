%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction NOT system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_NOT ')

result = 'Failed';
Flash ROM_Test_NOT
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if (true == gDebug)
	print_output_values();
end

if ((hex2dec('FFFF') == gp_reg_00) && ...
	(hex2dec('AAAA') == gp_reg_01) && ...
	(hex2dec('0000') == gp_reg_02))
   result = 'Passed';
end

fprintf('%s\n', result)
