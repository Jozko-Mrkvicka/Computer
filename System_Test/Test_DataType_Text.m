%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The TEXT datatype system test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
global gStepCount

fprintf('Test_DataType_Text ')
result = false;

Compile ROM_Test_DataType_Text
Flash CODE  ROM_Test_DataType_Text_Code  0x0000
Flash CONST ROM_Test_DataType_Text_Const 0x0000

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '7000');
read_output_values(output);


if isequal(data_bus_ram(1 : 56), 'The 9000 series is the most reliable computer ever made.')
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
