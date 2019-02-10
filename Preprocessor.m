%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function takes assembler code stored in matrix (N x 3)
% and converts it into machine (raw) code.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function out = Preprocessor(program)
    clc
    fprintf('########################\n');
    fprintf('# Assembler Preprocessor\n');
    fprintf('########################\n');
    
    % print unprocessed data (matrix)
    input_data = program
    
    error_code = 0;
    op1 = 0;
    op2 = 0;
    num_of_lines = size(program, 1);
    
    for (i = 1:num_of_lines)
        inst_prefix = bitand(program(i, 1), bin2dec('1111 0000'));

        [op1, op2, error_code] = select_type_of_operands(program(i, 2), program(i, 3), error_code, i);
        [inst_suffix, error_code] = select_instruction_variant(op1, op2, error_code, i);
        error_code = check_operand_combinations(inst_prefix, inst_suffix, error_code, i);
                
        % create final instruction code
        program(i, 1) = bitor(inst_prefix, inst_suffix);
        % erase prefix from operand 1
        program(i, 2) = bitand(program(i, 2), bin2dec('00 1111 1111'));
        % erase prefix from operand 2
        program(i, 3) = bitand(program(i, 3), bin2dec('00 1111 1111'));
    end
    
    if (error_code > 0)
        error('Preprocessing failed');
    else
        % print processed data (matrix)
        output_data = program
        
        % convert data to vector
        program = reshape(transpose(program), [], 1);
        
        fprintf('Preprocessing successful\n');
        out = program;
    end   
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function selects type of operands according to operand prefix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [op1, op2, error_code] = select_type_of_operands(operand_1, operand_2, error_code, i)
    is_address =  bin2dec('10 0000 0000');
    is_register = bin2dec('01 0000 0000');
    is_constant = bin2dec('00 0000 0000');
    op1_prefix =  bitand(operand_1, bin2dec('11 0000 0000'));
    op2_prefix =  bitand(operand_2, bin2dec('11 0000 0000'));
        
    % If first operand is ...
    if (op1_prefix == is_register)
       op1 = 'r';
    elseif (op1_prefix == is_address)
       op1 = 'a';
    elseif (op1_prefix == is_constant)
        op1 = 'c';
    else
        op1 = '0';
        error_code = 1;
        fprintf('ERROR#01 (line %d): Unknown type of first operand!!!\n', i);
    end

    % If second operand is ...
    if (op2_prefix == is_register)
       op2 = 'r';
    elseif (op2_prefix == is_address)
       op2 = 'a';
    elseif (op2_prefix == is_constant)
        op2 = 'c';
    else
        op2 = '0';
        fprintf('ERROR#02 (line %d): Unknown type of second operand!!!\n', i);
        error_code = 1;
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function selects the instruction variant (for example MOV -> MOVrr, MOVcr, ...)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [inst_suffix, error_code] = select_instruction_variant(op1, op2, error_code, i)
    if (('c' == op1) && ('r' == op2))
        inst_suffix = 0;
    elseif (('r' == op1) && ('r' == op2))
        inst_suffix = 1;
    elseif (('a' == op1) && ('r' == op2))
        inst_suffix = 2;
    elseif (('c' == op1) && ('a' == op2))
        inst_suffix = 3;
    elseif (('r' == op1) && ('a' == op2))
        inst_suffix = 4;
    elseif (('c' == op1) && ('c' == op2))
        inst_suffix = 5;
    elseif (('r' == op1) && ('c' == op2))
        inst_suffix = 6;
    elseif (('a' == op1) && ('c' == op2))
        inst_suffix = 7;
    else
        inst_suffix = 8; %0000 1000        
        fprintf('ERROR#03 (line %d): Wrong combination of operands!!!\n', i);
        error_code = 1;
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function checks that operand combination is correct (no forbidden combination occurs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function error_code = check_operand_combinations(inst_prefix, inst_suffix, error_code, i)
    Instructions
    
    switch (inst_prefix)
        case AND
            if (0 ~= inst_suffix) && ...
               (1 ~= inst_suffix)
                fprintf('ERROR#04 (line %d): Instruction AND: Wrong combination of operands!!!\n', i);
                error_code = 1;
            end

        case OR
            if (0 ~= inst_suffix) && ...
               (1 ~= inst_suffix)
                fprintf('ERROR#05 (line %d): Instruction OR: Wrong combination of operands!!!\n', i);
                error_code = 1;
            end

        case XOR
            if (0 ~= inst_suffix) && ...
               (1 ~= inst_suffix)
                fprintf('ERROR#06 (line %d): Instruction XOR: Wrong combination of operands!!!\n', i);
                error_code = 1;
            end

%             case NOT
%                 if (0 ~= inst_suffix) && ...
%                    (1 ~= inst_suffix)
%                     error('ERROR#07 (line %d): Instruction NOT: Wrong combination of operands!!!\n', i);
                  %error = 1;
%                 end

        case ADD
            if (0 ~= inst_suffix) && ...
               (1 ~= inst_suffix)
                fprintf('ERROR#08 (line %d): Instruction ADD: Wrong combination of operands!!!\n', i);
                error_code = 1;
            end

        case SUB
            if (0 ~= inst_suffix) && ...
               (1 ~= inst_suffix)
                fprintf('ERROR#09 (line %d): Instruction SUB: Wrong combination of operands!!!\n', i);
                error_code = 1;
            end

        case MOV
            if (0 ~= inst_suffix) && ...
               (1 ~= inst_suffix) && ...
               (2 ~= inst_suffix) && ...
               (3 ~= inst_suffix) && ...
               (4 ~= inst_suffix)
                fprintf('ERROR#10 (line %d): Instruction MOV: Wrong combination of operands!!!\n', i);
                error_code = 1;
            end

%             case JMP
%                 if (0 ~= inst_suffix) && ...
%                    (1 ~= inst_suffix)
%                     error('ERROR (line %d): Instruction JMP: Wrong combination of operands!!!\n', i);
%                 end

        otherwise
            fprintf('ERROR#11 (line %d): Unknown instruction!!!\n', i);
            error_code = 1;
            
    end
end


