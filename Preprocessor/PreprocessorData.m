data = Data;
POSITION_TYPE = 1;
POSITION_SIZE = 2;
POSITION_NAME = 3;

[numOfRows, numOfCols] = size(data);
if (3 ~= numOfCols)
    error('### PREPROCESSOR ERROR: Number of columns in the variable data array must be equal to 3 (type, size, name)!! ###');
end

addr = c.RAM_START;
for (row = 1 : numOfRows)
    dtype = data{row, POSITION_TYPE};
    dsize = data{row, POSITION_SIZE};
    name  = data{row, POSITION_NAME};

    % Create new matlab variable and assign its address.
    eval([name,' = addr;']);

    switch (dtype)
        case c.BYTE
            if ((c.RAM_START > (addr)) || ((c.RAM_START + c.RAM_SIZE) < (addr + dsize)))
                error('### PREPROCESSOR ERROR: Address of a variable points outside of the RAM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
            end
            addr = addr + 1*dsize;

        case c.WORD
            if ((c.RAM_START > (addr)) || ((c.RAM_START + c.RAM_SIZE) < (addr + 2*dsize)))
                error('### PREPROCESSOR ERROR: Address of a variable points outside of the RAM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
            end
            addr = addr + 2*dsize;

        case c.TEXT
            % Datatype TEXT stores 0 at the end of a string.
            if ((c.RAM_START > (addr)) || ((c.RAM_START + c.RAM_SIZE) < (addr + dsize + 1)))
                error('### PREPROCESSOR ERROR: Address of a variable points outside of the RAM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
            end
            addr = addr + 1*dsize + 1;

        otherwise
            error('### PREPROCESSOR ERROR: A constant has incorrect datatype!! ###');
    end
end

