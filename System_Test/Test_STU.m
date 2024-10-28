%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction STU system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_STU ')

result = false;
Flash ROM_Test_STU

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((0x22 == data_bus_ram(  0 + 1)) && ...
    (0x44 == data_bus_ram(255 + 1)) && ...
    (0x66 == data_bus_ram(256 + 1)) && ...
    (0x88 == data_bus_ram(511 + 1)))
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
