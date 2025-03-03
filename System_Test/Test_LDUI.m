%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction LDUI system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
global gStepCount

fprintf('Test_LDUI ')
result = false;

Compile ROM_Test_LDUI
Flash CODE ROM_Test_LDUI_Code 0x0000

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', gStepCount);
read_output_values(output);

if (0xAA00u16 == gp_reg_01)
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
