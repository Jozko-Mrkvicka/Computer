%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GP Timer system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
global gStepCount

fprintf('Test_Timer ')
result = false;

Compile ROM_Test_Timer
Flash CODE ROM_Test_Timer_Code 0x0000

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '350');
read_output_values(output);

if (0x0E == gp_reg_00)
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
