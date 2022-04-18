%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction LOADL system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_LOADL ')

result = false;
Flash ROM_Test_LOADL
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((hex2dec('00AA') == gp_reg_02) && ...
	(hex2dec('FFAA') == gp_reg_03))
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
