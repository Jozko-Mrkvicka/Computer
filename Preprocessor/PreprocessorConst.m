function compiledConstData = PreprocessorConst(data)
    Definitions

    POSITION_TYPE   = 1;
    POSITION_NAME   = 2;
    POSITION_VALUES = 3;

    [numOfRows, numOfCols] = size(data);

    % Initialize whole constant data ROM memory with zeros.
    compiledConstData(1 : ROM_DATA_SIZE) = uint8(0);

    if (3 ~= numOfCols)
        error('### PREPROCESSOR ERROR: Number of columns in the constant data array must be equal to 3 (type, name, value)!! ###');
    end

    addr = ROM_DATA_START + 1;
    for (row = 1 : numOfRows)
        dType    = data{row, POSITION_TYPE};
        name     = data{row, POSITION_NAME};
        array    = data{row, POSITION_VALUES};

        availableVariables = evalin('caller', 'whos');
        if ismember(name, {availableVariables(:).name})
            error('### PREPROCESSOR ERROR: A symbol with the same name defined multiple times (the constant "%s" already exists)!! ###', name);
        end

        % Create new Matlab variable and assign its address. This variable will be used
        % only as an internal metadata for the preprocessor.
        assignin('caller', 'addr',  addr);
        evalin('caller', [char(name),' = addr - 1;']);

        % Place data to binary image. This image will be "flashed" directly to ROM memory.
        switch (dType)
            case BYTE
                bytesPerVal = 1;
                arrayLen = size(array, 2);

                if ((ROM_DATA_START > (addr - 1)) || ((ROM_DATA_START + ROM_DATA_SIZE - 1) < (addr - 1 + bytesPerVal*arrayLen)))
                    error('### PREPROCESSOR ERROR: A constant does not fit to the data ROM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
                end

                for (i = 1 : arrayLen)
                    value = array{i};

                    if ((-128 > value) || (255 < value))
                        error('### PREPROCESSOR ERROR: A constant does not fit into the range of the BYTE datatype!! Allowable range is <-128, +255>. ###');
                    end

                    % Convert value to unsigned and store it to binary image.
                    value = dec2bin(value);
                    value = bin2dec(value);
                    compiledConstData(addr) = value;
                    addr = addr + bytesPerVal;
                end

            case WORD
                bytesPerVal = 2;
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

            case TEXT
                bytesPerVal = 1;
                arrayLen = size(array{1}, 2);
                textString = array{1};

                if ((ROM_DATA_START > (addr - 1)) || ((ROM_DATA_START + ROM_DATA_SIZE - 1) < (addr - 1 + bytesPerVal*arrayLen)))
                    error('### PREPROCESSOR ERROR: A constant does not fit to the data ROM!! (Name = %s, Address = 0x%04X) ###\n', name, addr - 1);
                end

                for (i = 1 : arrayLen)
                    value = textString(i);

                    if ((0 > value) || (255 < value))
                        error('### PREPROCESSOR ERROR: A text constant does not fit into the range of the TEXT datatype!! Allowable range is <0, +255>. ###');
                    end

                    compiledConstData(addr) = value;
                    addr = addr + bytesPerVal;
                end

                % Datatype TEXT stores 0 at the end of a string.
                compiledConstData(addr) = 0;
                addr = addr + 1;

            otherwise
                error('### PREPROCESSOR ERROR: A constant has incorrect datatype!! ###');
        end
    end
end