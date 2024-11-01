function Flash(compiled_code, addr)
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

    % Copy RomCode to base workspace.
    assignin('base', 'RomCode', RomCode);
end