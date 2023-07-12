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

if ((hex2dec('22') == DataBus_256_511(  0 + 1)) && ...
    (hex2dec('44') == DataBus_256_511(255 + 1)) && ...
    (hex2dec('66') == DataBus_512_767(  0 + 1)) && ...
    (hex2dec('88') == DataBus_512_767(255 + 1)))
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
