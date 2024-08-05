
		align	4
		label	L828_len__hla_ word
		dd	012h
		dd	012h
		label	L828_str__hla_ byte
		db	"enter data point: "
		db	0

		db	0

		align	4
		label	L850_len__hla_ word
		dd	012h
		dd	012h
		label	L850_str__hla_ byte
		db	"rolling average = "
		db	0

		db	0

		align	4
		label	L864_len__hla_ word
		dd	0bh
		dd	0bh
		label	L864_str__hla_ byte
		db	"more data? "
		db	0


		align	4
		label	L880_len__hla_ word
		dd	018h
		dd	018h
		label	L880_str__hla_ byte
		db	"final rolling average = "
		db	0

		db	0
		db	0
		db	0
