%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction OR system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_OR ')

result = false;
Flash ROM_Test_OR

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((hex2dec('0000') == gp_reg_00) && ...
	(hex2dec('FFFF') == gp_reg_01) && ...
	(hex2dec('FFFF') == gp_reg_02) && ...
	(hex2dec('FFFF') == gp_reg_05))
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
