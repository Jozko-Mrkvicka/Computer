function Compile(filename)
    clear SourceCode

    % Load constants and definitions (instructions, registers, ...).
    Instructions
    Definitions

    % Load a program to be compiled.
    % Script expects program to be stored in an array named "SourceCode"!!
    run(filename);

    % Compile source code (assembly language) to binary code.
    CompiledCode = Preprocessor(SourceCode, 0x0000, c);

    % Remove extension ".m" from the filename.
    filename = strrep(filename, ".m", "");

    assignin('base', filename, CompiledCode);
    assignin('base', 'c', c);
end