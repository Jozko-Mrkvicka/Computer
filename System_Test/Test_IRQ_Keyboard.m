%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Keyboard interrupt system test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
debug = true;

fprintf('Test_IRQ_Keyboard ')
Compile ROM_Test_IRQ_Keyboard_Main
Compile ROM_Test_IRQ_Keyboard_Handler
clear RomCode
Flash(ROM_Test_IRQ_Keyboard_Main,    c.ROM_START)
Flash(ROM_Test_IRQ_Keyboard_Handler, c.IRQ_KEYBOARD)

fprintf('Executing... ')
result = false;
pause('on');

% Press some button.
c.IRQ_Keyboard_Test = 1;

output = sim('Computer.slx', 'StopTime', '50');

% Release the button.
c.IRQ_Keyboard_Test = 0;

read_output_values(output);

if (0x0001 == gp_reg_00) &&    ...
   (0xFFFF == gp_reg_01) &&    ...
   (0x0002 == program_counter)
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
