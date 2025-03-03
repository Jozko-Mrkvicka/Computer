function Compile(Filename)
    clear Label
    clear ConstData
    clear SourceCode

    % Load constants and definitions (instructions, registers, ...).
    Instructions
    Definitions

    % Read the 'Label' array from 'Filename' and process it.
    section = 'LABEL';
    run(Filename);
    LabelCount = PreprocessorLabel(Label);

    % Read the 'ConstData' array from 'Filename' and process it.
    section = 'CONST';
    run(Filename);
    CompiledConstData = PreprocessorConst(ConstData);

    % Read the 'SourceCode' array from 'Filename' and process it.
    section = 'CODE';
    run(Filename);
    [CompiledCode] = PreprocessorCode(SourceCode, LabelCount);

    % From Filename.m create Filename.code and Filename.const.
    Filename = strrep(Filename, ".m", "");
    Filename_CompiledCode      = strcat(Filename, '_Code');
    Filename_CompiledConstData = strcat(Filename, '_Const');

    assignin('base', Filename_CompiledCode,      CompiledCode);
    assignin('base', Filename_CompiledConstData, CompiledConstData);
    assignin('base', 'c', c);
end
