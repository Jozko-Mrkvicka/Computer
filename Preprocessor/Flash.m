function Flash(file)
	clc

	% Load constants and definitions (instructions, registers, ...).
	Instructions
	Definitions
	% Video_Adapter
	% CharTable

	% Load the variable SourceCode from source file.
	run(file)

	% Compile source code (assembly language) to binary code and "flash" it to ROM.
	% "Flashing" means to assign the RomCode array to particular constants
	% in the Simulink model (ROM memory).
	RomCode = Preprocessor(SourceCode, c);
	assignin('base', 'RomCode', RomCode);
end