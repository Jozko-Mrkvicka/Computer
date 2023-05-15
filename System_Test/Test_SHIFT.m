%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction SHIFT system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_SHIFT ')

result = false;
Flash ROM_Test_SHIFT

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((hex2dec('C00E') == gp_reg_00) && ...
	(hex2dec('8000') == gp_reg_01) && ...
	(hex2dec('7003') == gp_reg_02) && ...
	(hex2dec('0001') == gp_reg_03) && ...
	(hex2dec('E007') == gp_reg_04))
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

