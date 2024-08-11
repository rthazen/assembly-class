
		align	4
		label	L821_len__hla_ word
		dd	01dh
		dd	01dh
		label	L821_str__hla_ byte
		db	"Gimme a size for your array: "
		db	0

		db	0
		db	0

		align	4
		label	L843_len__hla_ word
		dd	0bh
		dd	0bh
		label	L843_str__hla_ byte
		db	"BL before: "
		db	0


		align	4
		label	L867_len__hla_ word
		dd	0ah
		dd	0ah
		label	L867_str__hla_ byte
		db	"BL after: "
		db	0

		db	0

		align	4
		label	L891_len__hla_ word
		dd	0ch
		dd	0ch
		label	L891_str__hla_ byte
		db	"EBX before: "
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L915_len__hla_ word
		dd	0bh
		dd	0bh
		label	L915_str__hla_ byte
		db	"EBX after: "
		db	0


		align	4
		label	L939_len__hla_ word
		dd	05h
		dd	05h
		label	L939_str__hla_ byte
		db	"EAX: "
		db	0

		db	0
		db	0

		align	4
		label	L963_len__hla_ word
		dd	013h
		dd	013h
		label	L963_str__hla_ byte
		db	"dArrayBaseAddress: "
		db	0


		align	4
		label	L993_len__hla_ word
		dd	019h
		dd	019h
		label	L993_str__hla_ byte
		db	"Here's the array contents"
		db	0

		db	0
		db	0

		align	4
		label	L1016_len__hla_ word
		dd	02h
		dd	02h
		label	L1016_str__hla_ byte
		db	"A["
		db	0

		db	0

		align	4
		label	L1030_len__hla_ word
		dd	02h
		dd	02h
		label	L1030_str__hla_ byte
		db	"]="
		db	0

		db	0
