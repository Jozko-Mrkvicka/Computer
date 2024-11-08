%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Interrupts system test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global gDebug
debug = true;

fprintf('Test_IRQs ')
Compile ROM_Test_IRQs
Compile ROM_Test_IRQ_Keyboard_Handler
Compile ROM_Test_IRQ_Timer_Handler
clear RomCode
Flash(ROM_Test_IRQs,                 c.ROM_START)
Flash(ROM_Test_IRQ_Keyboard_Handler, c.IRQ_ADDR_KEYBOARD)
Flash(ROM_Test_IRQ_Timer_Handler,    c.IRQ_ADDR_TIMER)

fprintf('Executing... ')
result = false;
pause('on');
default_keyboard_delay = c.IRQ_KEYBOARD_DELAY;

% Press some button.
c.IRQ_Keyboard_Test = 1;
c.IRQ_KEYBOARD_DELAY = 32;

output = sim('Computer.slx', 'StopTime', '100');

% Release the button.
c.IRQ_Keyboard_Test = 0;
c.IRQ_KEYBOARD_DELAY = default_keyboard_delay;

read_output_values(output);

if (0x0003 == gp_reg_06) &&    ...
   (0x0005 == gp_reg_05) &&    ...
   (0x000C == program_counter)
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
