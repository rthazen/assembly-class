
		align	4
		label	L843_len__hla_ word
		dd	033h
		dd	033h
		label	L843_str__hla_ byte
		db	"Please enter some text to work with and hit Return!"
		db	0


		align	4
		label	L865_len__hla_ word
		dd	018h
		dd	018h
		label	L865_str__hla_ byte
		db	"The String You Entered: "
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L876_len__hla_ word
		dd	0eh
		dd	0eh
		label	L876_str__hla_ byte
		db	" Has Length = "
		db	0

		db	0
