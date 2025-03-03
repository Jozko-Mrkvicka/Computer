%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% System test for instructions PUSH and POP.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
global gStepCount

fprintf('Test_PUSH_POP ')
result = false;

Compile ROM_Test_PUSH_POP
Flash CODE ROM_Test_PUSH_POP_Code 0x0000

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '400');
read_output_values(output);

if ((0xAAAA == gp_reg_00) && ...
    (0xBBBB == gp_reg_01) && ...
    (0xCCCC == gp_reg_02) && ...
    (0xDDDD == gp_reg_03))
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

