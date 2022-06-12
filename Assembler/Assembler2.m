function [compiledData, compiledCode] = Assembler(fileAsm)
	clc

	global valid_datatypes;     valid_datatypes =    {'STR', 'UINT8', 'INT8', 'UINT16', 'INT16'};
	global valid_registers;     valid_registers =    {'r0', 'r1', 'r2', 'r3', 'r4', 'r5', 'r6', 'r7'};
	global valid_instructions;  valid_instructions = {'NOT', 'XOR', 'OR', 'AND', 'LOADL', 'LOADU', 'CMP', 'RET', 'POP', 'PUSH', 'SHIFT', ...
													  'ADD', 'NOT_USED', 'STOREL', 'STOREU', 'STORE', 'LOAD', 'MOV', 'ADDI', 'MOVU', ...
													  'LOADI', 'MOVL', 'SHIFTI', 'NOT_USED', 'STOREI', 'CMPI', 'JLT', 'JPE', 'CALL', 'JMP'};
	isValidNumConst('0x55')
end


function [valid] = isValidIdentifier(str)
	global valid_datatypes;
	global valid_registers;
	global valid_instructions;

	valid = true;

	% Example: 'some_string', 'some_string[5]' or 'some_string[0x2F]'.
	foundStr = regexp(str, '^(\w+)(\[\d+\]|\[0x[0-9a-fA-F]+\])?$', 'tokens');

	if (0 == size(foundStr))
		valid = false;
	else
		identifier = foundStr{1}(1);
		% array =      foundStr{1}(2);

		identifierStr = char(foundStr{1}(1));
		arrayStr =      char(foundStr{1}(2));

		% A data identifier can contain only alphanumerical characters and the underscore character!
		if (0 == size(identifierStr))
			valid = false;
		end

		% A keyword must not be used as a data identifier!
		if ((0 < ismember(identifier, valid_datatypes)) || ...
		    (0 < ismember(identifier, valid_registers)) || ...
		    (0 < ismember(identifier, valid_instructions)))
			valid = false;
		end

		% Name of identifier must not begin with a digit!
		if (0 < char(regexp(identifierStr, '^\d')))
			valid = false;
		end

		% If identifier represents an array ...
		if (0 < size(arrayStr))
			% Parse array lenght.
			foundStr = regexp(arrayStr, '^\[(.+)\]$', 'tokens');
			arrayLen = char(foundStr{1}(1));

			if (true == isValidNumConst(arrayLen))
				arrayLen = convertStrToNum(arrayLen);

				% Array length must be greater than zero.
				if (1 > arrayLen)
					valid = false;
				end
			else
				valid = false;
			end
		end
	end
end


function [valid] = isValidDatatype(str)
	global valid_datatypes;

	valid = true;
	if (0 == ismember(str, valid_datatypes))
		valid = false;
	end
end


function [valid] = isValidRegister(str)
	global valid_registers;

	valid = true;
	if (0 == ismember(str, valid_registers))
		valid = false;
	end
end


function [valid] = isValidInstruction(str)
	global valid_instructions;

	valid = true;
	if (0 == ismember(str, valid_instructions))
		valid = false;
	end
end


% Is string a valid numerical constant?
function [valid] = isValidNumConst(str)
	valid = true;
	foundStr = regexp(str, '^(0x)?(.+)$', 'tokens');

	if (0 == size(foundStr))
		valid = false;
	else
		isHex =  char(foundStr{1}(1));
		number = char(foundStr{1}(2));

		if ((0 < size(isHex, 2)))
			foundStr = regexp(number, '^([0-9A-Fa-f]+)$', 'tokens');
		else
			foundStr = regexp(number, '^([-+]?\d+)$', 'tokens');
		end

		if (0 == size(foundStr))
			valid = false;
		end
	end
end


function [valid] = isValidStrConst(str)

end


% Convert a string input to a numerical constant.
% Note: This function assumes that the syntax of the input string has been already checked.
function [value] = convertStrToNum(str)
	foundStr = regexp(str, '^(0x)?([-+]?[0-9a-fA-F]+)$', 'tokens');

	isHex = char(foundStr{1}(1));
	value = char(foundStr{1}(2));

	if (0 < size(isHex))
		value = hex2dec(value);
	else
		value = str2num(value);
	end
end

