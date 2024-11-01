%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% System test for instructions CALL and RET.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_CALL_RET ')
result = false;

Compile ROM_Test_CALL_RET
Flash(ROM_Test_CALL_RET, 0x0000)

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '200');
read_output_values(output);

if ((0x4444 == gp_reg_00) && ...
    (0x4444 == gp_reg_01) && ...
    (0x4444 == gp_reg_02) && ...
    (0x4444 == gp_reg_03))
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

