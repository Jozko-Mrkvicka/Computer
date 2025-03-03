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
    if exist('Label')
        LabelCount = PreprocessorLabel(Label);
    else
        LabelCount = 0;
    end

    % Read the 'ConstData' array from 'Filename' and process it.
    section = 'CONST';
    run(Filename);
    if exist('ConstData')
        CompiledConstData = PreprocessorConst(ConstData);
    end

    % Read the 'SourceCode' array from 'Filename' and process it.
    section = 'CODE';
    run(Filename);
    if exist('SourceCode')
        [CompiledCode] = PreprocessorCode(SourceCode, LabelCount);
    end

    % From Filename.m create Filename.code and Filename.const.
    Filename = strrep(Filename, ".m", "");
    Filename_CompiledCode      = strcat(Filename, '_Code');
    Filename_CompiledConstData = strcat(Filename, '_Const');

    if exist('SourceCode')
        assignin('base', Filename_CompiledCode,      CompiledCode);
    end

    if exist('ConstData')
        assignin('base', Filename_CompiledConstData, CompiledConstData);
    end

    assignin('base', 'c', c);
end
