function compiledConstData = PreprocessorConst(data)
    Definitions

    POSITION_TYPE  = 1;
    POSITION_NAME  = 2;
    POSITION_VALUE = 3;

    [numOfRows, numOfCols] = size(data);
    compiledConstData(1 : c.ROM_DATA_SIZE) = uint8(0);

    if (3 ~= numOfCols)
        error('### PREPROCESSOR ERROR: Number of columns in the constant data array must be equal to 3 (type, name, value)!! ###');
    end

    addr = c.ROM_DATA_START + 1;
    for (row = 1 : numOfRows)
        dType = data{row, POSITION_TYPE};
        name  = data{row, POSITION_NAME};
        value = data{row, POSITION_VALUE};

        % Create new matlab variable and assign its address.
        assignin('caller', 'addr',  addr);
        evalin('caller', [char(name),' = addr - 1;']);

        switch (dType)
            case c.BYTE
                if ((c.ROM_DATA_START > (addr - 1)) || ((c.ROM_DATA_START + c.ROM_DATA_SIZE - 1) < (addr - 1)))
                    error('### PREPROCESSOR ERROR: Address of a constant points outside of the data ROM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
                end

                if ((-128 > value) || (255 < value))
                    error('### PREPROCESSOR ERROR: A constant does not fit into the range of the BYTE datatype!! Allowable range is <-128, +255>. ###');
                end

                compiledConstData(addr) = value;
                addr = addr + 1;

            % case c.WORD
            %     if ((c.ROM_DATA_START > (addr - 1)) || ((c.ROM_DATA_START + c.ROM_DATA_SIZE - 1) < (addr - 0)))
            %         error('### PREPROCESSOR ERROR: Address of a constant points outside of the data ROM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
            %     end

            %     if ((-32768 > value) || (65535 < value))
            %         error('### PREPROCESSOR ERROR: A constant does not fit into the range of the WORD datatype!! Allowable range is <-32768, +65535>. ###');
            %     end
            %     compiledConstData(addr) = c.lsb(value);
            %     addr = addr + 1;
            %     compiledConstData(addr) = c.msb(value);
            %     addr = addr + 1;

            % case c.TEXT
            %     [temp stringSize] = size(data{row, POSITION_VALUE});

            %     if ((c.ROM_DATA_START > (addr - 1)) || ((c.ROM_DATA_START + c.ROM_DATA_SIZE - 1) < (addr - 1 + stringSize)))
            %         error('### PREPROCESSOR ERROR: Address of a constant points outside of the data ROM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
            %     end

            %     i = 1;
            %     for (addr = addr : addr + stringSize - 1)
            %         compiledConstData(addr) = uint8(value(i));
            %         i = i + 1;
            %     end
            %     addr = addr + 1;

            %     % Datatype TEXT stores 0 at the end of a string.
            %     compiledConstData(addr) = 0;
            %     addr = addr + 1;

            otherwise
                error('### PREPROCESSOR ERROR: A constant has incorrect datatype!! ###');
        end
    end
end