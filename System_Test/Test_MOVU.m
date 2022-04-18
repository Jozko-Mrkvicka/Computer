%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction MOVU system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_MOVU ')

result = false;
Flash ROM_Test_MOVU
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((hex2dec('BB00') == gp_reg_00) && ...
	(hex2dec('BBFF') == gp_reg_01))
	result = true;
end

if ((true == gDebug) || (false == result))
	print_output_values();
end

if (true == result)
	fprintf('Passed\n', result)
else
	fprintf('Failed\n', result)
end
