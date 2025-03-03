function compiledData = PreprocessData(data)
    Definitions

    POSITION_TYPE = 1;
    POSITION_NAME = 2;
    POSITION_VAL  = 3;

    [numOfRows, numOfCols] = size(data);
    if (3 ~= numOfCols)
        error('### PREPROCESSOR ERROR: Number of columns in the variable data array must be equal to 3 (type, size, name)!! ###');
    end

    addr = c.ROM_DATA_START;

    % We want to address memory from 0x0000 but the Matlab array index starts from 1.
    addr = addr + 1;

    for (row = 1 : numOfRows)
        type = data{row, POSITION_TYPE};
        name = data{row, POSITION_NAME};
        val  = data{row, POSITION_VAL};

        % Create new matlab variable and assign its address.
        eval([name,' = addr;']);

        switch (type)
            case c.BYTE
                % Check address.
                if (c.ROM_DATA_START > addr) || ((c.ROM_DATA_START + c.ROM_DATA_SIZE) < addr)
                    error('### PREPROCESSOR ERROR: Address of a variable points outside of the RAM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
                end

                % Check value.
                if (0 <= val) && (255 >= val)
                  compiledData(addr) = uint8(val);
                else
                  error('### PREPROCESSOR ERROR: A constant does not fit into the range of the U8 type!! Range of U8 type is <0, +255>. ###')
                end

                addr = addr + 1;

            % case c.WORD
            %     if ((c.RAM_START > (addr)) || ((c.RAM_START + c.RAM_SIZE) < (addr + 2*dSize)))
            %         error('### PREPROCESSOR ERROR: Address of a variable points outside of the RAM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
            %     end
            %     addr = addr + 2*dSize;

            % case c.TEXT
            %     % Datatype TEXT stores 0 at the end of a string.
            %     if ((c.RAM_START > (addr)) || ((c.RAM_START + c.RAM_SIZE) < (addr + dSize + 1)))
            %         error('### PREPROCESSOR ERROR: Address of a variable points outside of the RAM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
            %     end
            %     addr = addr + 1*dSize + 1;

            otherwise
                error('### PREPROCESSOR ERROR: A constant has incorrect datatype!! ###');
        end
    end
end
