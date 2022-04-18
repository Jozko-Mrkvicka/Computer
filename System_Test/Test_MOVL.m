%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction MOVL system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_MOVL ')

result = false;
Flash ROM_Test_MOVL
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((hex2dec('FFAA') == gp_reg_00) && ...
	(hex2dec('0055') == gp_reg_01))
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
