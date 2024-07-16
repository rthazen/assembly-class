
		align	4
		label	L820_len__hla_ word
		dd	02ch
		dd	02ch
		label	L820_str__hla_ byte
		db	"Enter an integer between 32,768 and 65,535: "
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L834_len__hla_ word
		dd	0ch
		dd	0ch
		label	L834_str__hla_ byte
		db	"You entered "
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L858_len__hla_ word
		dd	023h
		dd	023h
		label	L858_str__hla_ byte
		db	"Treated as a signed integer, it is "
		db	0

