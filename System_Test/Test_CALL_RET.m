%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% System test for instructions CALL and RET.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_CALL_RET ')

result = false;
Flash ROM_Test_CALL_RET
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((hex2dec('2222') == gp_reg_00) && ...
	(hex2dec('2222') == gp_reg_01) && ...
	(hex2dec('2222') == gp_reg_02) && ...
	(hex2dec('2222') == gp_reg_03))
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

