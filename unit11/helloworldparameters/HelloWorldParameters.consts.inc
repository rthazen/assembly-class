
		align	4
		label	L822_len__hla_ word
		dd	01ah
		dd	01ah
		label	L822_str__hla_ byte
		db	"value of iReturnAddress = "
		db	0

		db	0

		align	4
		label	L846_len__hla_ word
		dd	0dh
		dd	0dh
		label	L846_str__hla_ byte
		db	"value of i = "
		db	0

		db	0
		db	0

		align	4
		label	L870_len__hla_ word
		dd	014h
		dd	014h
		label	L870_str__hla_ byte
		db	"value of second i = "
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L894_len__hla_ word
		dd	017h
		dd	017h
		label	L894_str__hla_ byte
		db	"Hello, World Procedure!"
		db	0


		align	4
		label	L912_len__hla_ word
		dd	0eh
		dd	0eh
		label	L912_str__hla_ byte
		db	"value of AX = "
		db	0

		db	0

		align	4
		label	L936_len__hla_ word
		dd	012h
		dd	012h
		label	L936_str__hla_ byte
		db	"value of iValue = "
		db	0

		db	0

		align	4
		label	L960_len__hla_ word
		dd	018h
		dd	018h
		label	L960_str__hla_ byte
		db	"Calling Hello Parameters"
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L978_len__hla_ word
		dd	01eh
		dd	01eh
		label	L978_str__hla_ byte
		db	"Returned from Hello Parameters"
		db	0

		db	0
