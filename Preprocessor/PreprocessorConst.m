function compiledConstData = PreprocessorConst(data)
    Definitions

    POSITION_TYPE  = 1;
    POSITION_NAME  = 2;
    POSITION_VALUE = 3;

    [numOfRows, numOfCols] = size(data);

    % Initialize whole constant data ROM memory with zeros.
    compiledConstData(1 : ROM_DATA_SIZE) = uint8(0);

    if (3 ~= numOfCols)
        error('### PREPROCESSOR ERROR: Number of columns in the constant data array must be equal to 3 (type, name, value)!! ###');
    end

    addr = ROM_DATA_START + 1;
    for (row = 1 : numOfRows)
        dType = data{row, POSITION_TYPE};
        name  = data{row, POSITION_NAME};
        value = data{row, POSITION_VALUE};

        availableVariables = evalin('caller', 'whos');
        if ismember(name, {availableVariables(:).name})
            error('### PREPROCESSOR ERROR: A symbol with the same name defined multiple times (the constant "%s" already exists)!! ###', name);
        end

        % Create new Matlab variable and assign its address.
        assignin('caller', 'addr',  addr);
        evalin('caller', [char(name),' = addr - 1;']);

        switch (dType)
            case BYTE
                if ((ROM_DATA_START > (addr - 1)) || ((ROM_DATA_START + ROM_DATA_SIZE - 1) < (addr - 1)))
                    error('### PREPROCESSOR ERROR: Address of a constant points outside of the data ROM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
                end

                if ((-128 > value) || (255 < value))
                    error('### PREPROCESSOR ERROR: A constant does not fit into the range of the BYTE datatype!! Allowable range is <-128, +255>. ###');
                end

                % Convert value to unsigned and store it to binary image.
                value = dec2bin(value);
                value = bin2dec(value);
                compiledConstData(addr) = value;
                addr = addr + 1;

            % case WORD
            %     if ((ROM_DATA_START > (addr - 1)) || ((ROM_DATA_START + ROM_DATA_SIZE - 1) < (addr - 0)))
            %         error('### PREPROCESSOR ERROR: Address of a constant points outside of the data ROM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
            %     end

            %     if ((-32768 > value) || (65535 < value))
            %         error('### PREPROCESSOR ERROR: A constant does not fit into the range of the WORD datatype!! Allowable range is <-32768, +65535>. ###');
            %     end
            %     compiledConstData(addr) = lsb(value);
            %     addr = addr + 1;
            %     compiledConstData(addr) = msb(value);
            %     addr = addr + 1;

            % case TEXT
            %     [temp stringSize] = size(data{row, POSITION_VALUE});

            %     if ((ROM_DATA_START > (addr - 1)) || ((ROM_DATA_START + ROM_DATA_SIZE - 1) < (addr - 1 + stringSize)))
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