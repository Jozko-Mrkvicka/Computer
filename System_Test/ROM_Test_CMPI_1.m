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
				MOVL		r0			0			... 
				MOVU		r0			0			...
				CMPI		r0			0			... % Expected value: r0 == 0
													...
	LABEL_		JMP			LABEL					...
];

