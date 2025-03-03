function Flash(MemType, File, Addr)
    % Input params are expected in a string form, therefore we must convert
    % them to appropriate datatypes.
    Addr = hex2dec(Addr);
    File = evalin('base', File);

    Definitions

    % We want to address memory from 0x0000 but the Matlab array index starts from 1.
    Addr = Addr + 1;


    % Flash instruction ROM.
    if strcmpi('CODE', MemType)

        % Check if RomCode already exists in the base workspace. If not then create local one.
        if evalin('base', 'exist("RomCode");')
            RomCode = evalin("base", "RomCode");
        else
            RomCode(1 : c.ROM_SIZE) = uint16(0);
        end

        % Create RomCodeBreakpoints in the base workspace if they don`t exist already.
        if (false == evalin('base', 'exist("RomCodeBreakpoints");'))
            evalin("base", "RomCodeBreakpoints = 0 : c.ROM_SIZE - 1;");
        end

        % "Flash" binary image to ROM.
        len = size(File, 2);
        RomCode(Addr : (Addr + len - 1)) = File(1 : len);

        % Check if ROM code fits to the ROM memory.
        if (size(RomCode, 2) > c.ROM_SIZE) 
            error('###\nFLASH ERROR: Binary image is bigger than available size of ROM memory!!\nAvailable ROM memory: %d (words)\nActual image size:    %d (words)\n###', c.ROM_SIZE, size(RomCode, 2))
        end

        % Copy RomCode to base workspace.
        assignin('base', 'RomCode',            RomCode);


    % Flash data ROM.
    elseif strcmpi('CONST', MemType)

        % Check if RomData already exists in the base workspace. If not then create local one.
        if evalin('base', 'exist("RomData");')
            RomData = evalin("base", "RomData");
        else
            RomData(1 : c.ROM_DATA_SIZE) = uint8(0);
            
        end

        % Create RomDataBreakpoints in the base workspace if they don`t exist already.
        if (false == evalin('base', 'exist("RomDataBreakpoints");'))
            evalin("base", "RomDataBreakpoints = 0 : c.ROM_DATA_SIZE - 1;");
        end

        % "Flash" binary image to ROM.
        len = size(File, 2);
        RomData(Addr : (Addr + len - 1)) = File(1 : len);

        % Check if constant data fit to the data ROM memory.
        if (size(RomData, 2) > c.ROM_DATA_SIZE) 
            error('###\nFLASH ERROR: Binary image is bigger than available size of ROM memory!!\nAvailable ROM memory: %d (words)\nActual image size:    %d (words)\n###', c.CONST_DATA_SIZE, size(RomData, 2))
        end

        % Copy RomData to base workspace.
        assignin('base', 'RomData',            RomData);


    else
        error('###\nFLASH ERROR: Unknown first input parameter (MemType)!!\nAvailable memory types: CODE, CONST.');
    end
end
