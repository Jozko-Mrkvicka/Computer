HALUŠKA 9000
============
This is a simulation of very simple 16-bit computer based on logic gates implemented in Matlab/Simulink.
Computer has CPU with 29 instructions, memory consists of 4KB ROM (instructions), 4KB RAM, 1KB video memory, and 4KB of data ROM.
input unit (simple numeric keyboard) and output display (8x16 pixel resolution). To demonstrate
its capabilities there is Snake game hardcoded in ROM.

!!!Please note that this is not the final version, project is still under development!!!


How to run 
----------
- Switch Matlab path to the Computer folder.

- From Matlab command line run the following commands:
    - "Run_Unit_Tests"                            - to check all libraries.
    - "Run_System_Tests"                          - to check high level functionalities.
    - "Compile ROM_Test_UART_Tx"                  - to build binary image of an application.
    - "Flash CODE ROM_Test_UART_Tx_Code 0x0000"   - to program instruction memory from address 0 with the compiled image.
    - "Flash CONST ROM_Test_UART_Tx_Const 0x0000" - to program constant data memory from address 0 with the compiled image.
    - "Computer"                                  - to open computer model.

- In Simulink window click on "play" button to run (or step) simulation.

- From Matlab command line run the following commands:
    - "FrontPanel" - to open front panel debugging/control window.
    - "DataMemory" - to open data memory debugging/control window.

    In file ROM.m there is placed assembly ROM code (firmware) which will be executed after "power on"
(after pressing Run button in Simulink window). This assembly code must be "compiled" to binary
before execution. The assembly code is placed in matlab array in the double format (default matlab format
for storing numeric data). During "compilation" the assembly code is converted to uint16_t format
and can be executed. To compile the code execute ROM.m file from Matlab command line (>> ROM).
You will see compiled binary code in uint16_t format as well as in uint8_t format (MSB/LSB) and also
original assembly code (for your convenience, handy for debugging/crosschecking). 

NOTE: If you forget to "compile" and you try to run the simulation then you will see the following error
message:
    Invalid setting in 'Computer/Memory/32B_ROM_Memory(Addr 0..15)/Byte_00' for parameter 'Value'.
    Caused by:
    Error evaluating parameter 'Value' in 'Computer/Memory/32B_ROM_Memory(Addr 0..15)/Byte_00'
    Undefined function 'RomCode' for input arguments of type 'double'.

After successful "compilation" open the file Computer.slx and press the Run button. Simulation will start.

