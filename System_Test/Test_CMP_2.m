%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction CMP system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_CMP_2 ')
result = false;

Compile ROM_Test_CMP_2
Flash(ROM_Test_CMP_2, 0x0000)

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((1 == status_register_equal) && ...
    (0 == status_register_lessthansigned) && ...
    (0 == status_register_lessthanunsigned))
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
