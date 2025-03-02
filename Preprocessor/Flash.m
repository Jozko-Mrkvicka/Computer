function Flash(compiled_code, addr)
    % Input params are expected in a string form, therefore we must convert
    % them to appropriate datatypes.
    addr = hex2dec(addr);
    compiled_code = evalin('base', compiled_code);

    Definitions

    % Check if RomCode already exists in the base workspace. If not then create local one.
    if evalin('base', 'exist("RomCode");')
        RomCode = evalin("base", "RomCode");
    else
        RomCode(1 : c.ROM_SIZE) = uint16(0);
    end
    
    % We want to address memory from 0x0000 but Matlab array index starts from 1.
    addr = addr + 1;

    % "Flash" binary image to ROM.
    len = size(compiled_code, 2);
    RomCode(addr : (addr + len - 1)) = compiled_code(1 : len);

    % Check if ROM code fits to the ROM memory.
    if (size(RomCode, 2) > c.ROM_SIZE) 
        error('###\nFLASH ERROR: Binary image is bigger than available size of ROM memory!!\nAvailable ROM memory: %d (words)\nActual image size:    %d (words)\n###', c.ROM_SIZE, size(RomCode, 2))
    end

    % Copy RomCode to base workspace.
    assignin('base', 'RomCode', RomCode);
end