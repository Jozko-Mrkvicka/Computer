%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The WORD datatype system test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
global gStepCount

fprintf('Test_DataType_Word ')
result = false;

Compile ROM_Test_DataType_Word
Flash CODE  ROM_Test_DataType_Word_Code  0x0000
Flash CONST ROM_Test_DataType_Word_Const 0x0000

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '1200');
read_output_values(output);

if (0xAF == data_bus_ram(1)) && ...
   (0xDE == data_bus_ram(2)) && ...
   (0xBE == data_bus_ram(3)) && ...
   (0xBA == data_bus_ram(4)) && ...
   (0xED == data_bus_ram(5)) && ...
   (0xFE == data_bus_ram(6)) && ...
   (0xAD == data_bus_ram(7)) && ...
   (0xDE == data_bus_ram(8)) && ...
   (0xEF == data_bus_ram(9)) && ...
   (0xBE == data_bus_ram(10))   ...
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
