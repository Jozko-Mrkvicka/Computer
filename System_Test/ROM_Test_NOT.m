label = ...
{
	'LABEL'
};
for (idx = 1:size(label))
	eval([char(label(idx)),'  = bitor(c.LABEL_SRC_PREFIX,  idx);']);
	eval([char(label(idx)),'_ = bitor(c.LABEL_DEST_PREFIX, idx);']);
end
c.LBL_CNT = idx;



SourceCode = ...
[
				MOVL		r0			hFF			...
				MOVU		r0			hFF			...
				NOT			r0						...
	LABEL_		JMP			LABEL					...
];

