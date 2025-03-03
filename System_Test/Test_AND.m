%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction AND system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
global gStepCount

fprintf('Test_AND ')
result = false;

Compile ROM_Test_AND
Flash CODE ROM_Test_AND_Code 0x0000

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', gStepCount);
read_output_values(output);

if ((0x0000 == gp_reg_00) && ...
    (0xFFFF == gp_reg_01) && ...
    (0x0000 == gp_reg_02) && ...
    (0xAAAA == gp_reg_05))
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
