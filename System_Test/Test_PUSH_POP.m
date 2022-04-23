%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% System test for instructions PUSH and POP.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_PUSH_POP ')

result = false;
Flash ROM_Test_PUSH_POP
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((hex2dec('AAAA') == gp_reg_00) && ...
	(hex2dec('BBBB') == gp_reg_01) && ...
	(hex2dec('CCCC') == gp_reg_02) && ...
	(hex2dec('DDDD') == gp_reg_03))
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

