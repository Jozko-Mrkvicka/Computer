%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction CMPI system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_CMPI_4 ')

result = false;
Flash ROM_Test_CMPI_4

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((0 == status_register_equal) && ...
	(0 == status_register_lessthansigned) && ...
	(1 == status_register_lessthanunsigned))
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
