Computer
========
This is a simulation of very simple 8-bit computer based on logic gates implemented in matlab/simulink.
Computer has CPU with 20 instructions, 32B (bytes, not kilobytes!!) of RAM memory, 512B ROM memory,
input unit (simple numeric keyboard) and output display (8x16 pixel resolution). To demonstrate
its capabilities there is Snake game hardcoded in ROM.

Please note that this is not the final version, project is still under development.


How to run 
----------
	In file ROM.m there is placed assembly ROM code (firmware) which will be executed after "power on"
(after pressing Run button in simulink window). This assembly code must be "compiled" to binary
before execution. The assembly code is placed in matlab array in the double format (default matlab format
for storing numeric data). During "compilation" the assembly code is converted to uint16_t format
and can be executed. To compile the code execute ROM.m file from matlab command line (>> ROM).
You will see compiled binary code in uint16_t format as well as in uint8_t format (MSB/LSB) and also
original assembly code (for your convenience, handy for debugging/crosschecking). 

NOTE: If you forget to "compile" and you try to run the simulation then you will see the following error
message:
	Invalid setting in 'Computer/Memory/32B_ROM_Memory(Addr 0..15)/Byte_00' for parameter 'Value'.
	Caused by:
	Error evaluating parameter 'Value' in 'Computer/Memory/32B_ROM_Memory(Addr 0..15)/Byte_00'
	Undefined function 'RomCode' for input arguments of type 'double'.

After successful "compilation" open the file Computer.slx and press the Run button. Simulation will start.


