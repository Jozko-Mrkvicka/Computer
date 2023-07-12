%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction STL system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug

fprintf('Test_STL ')

result = false;
Flash ROM_Test_STL

fprintf('Executing... ')
output = sim('Computer.slx', 'StopTime', '50');
read_output_values(output);

if ((hex2dec('11') == DataBus_256_511(  0 + 1)) && ...
    (hex2dec('33') == DataBus_256_511(255 + 1)) && ...
    (hex2dec('55') == DataBus_512_767(  0 + 1)) && ...
    (hex2dec('77') == DataBus_512_767(255 + 1)))
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
