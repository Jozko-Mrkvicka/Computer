%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction STOREU system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_STOREU ')

result = false;
Flash ROM_Test_STOREU
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((hex2dec('BB00') == ram_00) && ...
	(hex2dec('BBFF') == ram_01))
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