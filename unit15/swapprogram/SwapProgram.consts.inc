
		align	4
		label	L827_len__hla_ word
		dd	017h
		dd	017h
		label	L827_str__hla_ byte
		db	"gimme a value to swap: "
		db	0


		align	4
		label	L849_len__hla_ word
		dd	01ch
		dd	01ch
		label	L849_str__hla_ byte
		db	"gimme another value to swap:"
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L871_len__hla_ word
		dd	0bh
		dd	0bh
		label	L871_str__hla_ byte
		db	"swapping..."
		db	0


		align	4
		label	L889_len__hla_ word
		dd	0ah
		dd	0ah
		label	L889_str__hla_ byte
		db	"iValue1 = "
		db	0

		db	0

		align	4
		label	L913_len__hla_ word
		dd	0ah
		dd	0ah
		label	L913_str__hla_ byte
		db	"iValue2 = "
		db	0

		db	0
