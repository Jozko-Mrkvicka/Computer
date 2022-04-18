%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction ADDI system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_ADDI ')

result = false;
Flash ROM_Test_ADDI
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((hex2dec('FFFF') == gp_reg_00) && ...
	(hex2dec('8000') == gp_reg_01) && ...
	(hex2dec('7FFF') == gp_reg_03))
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
