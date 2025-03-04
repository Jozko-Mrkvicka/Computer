function Flash(MemType, File, Addr)
    % Input params are expected in a string form, therefore we must convert
    % them to appropriate datatypes.
    Addr = hex2dec(Addr);
    File = evalin('base', File);

    Definitions

    % We want to address memory from 0x0000 but the Matlab array index starts from 1.
    Addr = Addr + 1;

    % Create RomCodeBreakpoints in the base workspace if they don`t exist already.
    if (false == evalin('base', 'exist("RomCodeBreakpoints");'))
        RomCodeBreakpoints = 0 : ROM_SIZE - 1;
        assignin('base', 'RomCodeBreakpoints', RomCodeBreakpoints);
    end

    % Create RomDataBreakpoints in the base workspace if they don`t exist already.
    if (false == evalin('base', 'exist("RomDataBreakpoints");'))
        RomDataBreakpoints = 0 : ROM_SIZE - 1;
        assignin('base', 'RomDataBreakpoints', RomDataBreakpoints);
    end

    % Create RomData in the base workspace if they don`t exist already.
    if evalin('base', 'exist("RomData");')
        RomData = evalin("base", "RomData");
    else
        RomData(1 : ROM_DATA_SIZE) = uint8(0);
    end

    % Create RomCode in the base workspace if it doesn`t exist already.
    if evalin('base', 'exist("RomCode");')
        RomCode = evalin("base", "RomCode");
    else
        RomCode(1 : ROM_SIZE) = uint16(0);
    end


    % "Flash" binary image to instruction ROM.
    if strcmpi('CODE', MemType)
        len = size(File, 2);
        RomCode(Addr : (Addr + len - 1)) = File(1 : len);

        % Check if ROM code fits to the ROM memory.
        if (size(RomCode, 2) > ROM_SIZE) 
            error('###\nFLASH ERROR: Binary image is bigger than available size of ROM memory!!\nAvailable ROM memory: %d (words)\nActual image size:    %d (words)\n###', ROM_SIZE, size(RomCode, 2))
        end

        % Copy RomCode to base workspace.
        assignin('base', 'RomCode', RomCode);

    % "Flash" binary image to data ROM.
    elseif strcmpi('CONST', MemType)
        len = size(File, 2);
        RomData(Addr : (Addr + len - 1)) = File(1 : len);

        % Check if constant data fit to the data ROM memory.
        if (size(RomData, 2) > ROM_DATA_SIZE) 
            error('###\nFLASH ERROR: Binary image is bigger than available size of ROM memory!!\nAvailable ROM memory: %d (words)\nActual image size:    %d (words)\n###', CONST_DATA_SIZE, size(RomData, 2))
        end

    else
        error('###\nFLASH ERROR: Unknown first input parameter (MemType)!!\nAvailable memory types: CODE, CONST.');
    end


    % Copy RomData to base workspace. We need the data ROM to be filled 
    % with something whether our program uses it or not.
    assignin('base', 'RomData', RomData);
end
