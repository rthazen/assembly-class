
		align	4
		label	L819_len__hla_ word
		dd	01bh
		dd	01bh
		label	L819_str__hla_ byte
		db	"Input a hexadecimal value: "
		db	0


		align	4
		label	L841_len__hla_ word
		dd	01h
		dd	01h
		label	L841_str__hla_ byte
		db	"$"
		db	0

		db	0
		db	0

		align	4
		label	L852_len__hla_ word
		dd	019h
		dd	019h
		label	L852_str__hla_ byte
		db	" converted to decimal is "
		db	0

		db	0
		db	0
