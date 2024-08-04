
		align	4
		label	L822_len__hla_ word
		dd	0bh
		dd	0bh
		label	L822_str__hla_ byte
		db	"Feed Me W: "
		db	0


		align	4
		label	L836_len__hla_ word
		dd	0bh
		dd	0bh
		label	L836_str__hla_ byte
		db	"Feed Me X: "
		db	0


		align	4
		label	L850_len__hla_ word
		dd	0bh
		dd	0bh
		label	L850_str__hla_ byte
		db	"Feed Me Y: "
		db	0


		align	4
		label	L864_len__hla_ word
		dd	0bh
		dd	0bh
		label	L864_str__hla_ byte
		db	"Feed Me Z: "
		db	0


		align	4
		label	L879_len__hla_ word
		dd	0ch
		dd	0ch
		label	L879_str__hla_ byte
		db	"Same. AL = 1"
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L894_len__hla_ word
		dd	014h
		dd	014h
		label	L894_str__hla_ byte
		db	"Not the same. AL = 0"
		db	0

		db	0
		db	0
		db	0
