; Assembly code emitted by HLA compiler
; Version 1.76 build 9932 (prototype)
; HLA compiler written by Randall Hyde
; FASM compatible output

		format	MS COFF


offset32	equ	 
ptr	equ	 

macro global [symbol]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol
   isextrn = 1
 end if
}

macro global2 [symbol,type]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol:type
   isextrn = 1
 end if
}


ExceptionPtr__hla_	equ	fs:0

		include	'jtable.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'jtable.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'jtable.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'jtable.consts.inc'

		include	'jtable.ro.inc'

; Code begins here:



;/* HWexcept__hla_ gets called when Windows raises the exception. */

HWexcept__hla_ :
		jmp	HardwareException__hla_
;HWexcept__hla_  endp

DfltExHndlr__hla_:
		jmp	DefaultExceptionHandler__hla_
;DfltExHndlr__hla_ endp



_HLAMain       :


;/* Set up the Structured Exception Handler record */
;/* for this program. */

		call	BuildExcepts__hla_
		pushd	0		;/* No Dynamic Link. */
		mov	ebp, esp	;/* Pointer to Main's locals */
		push	ebp		;/* Main's display. */


		push	L832_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_startingValue__hla_+0], eax	;/* startingValue */
		pop	eax
		mov	eax, dword ptr [L806_startingValue__hla_+0]	;/* startingValue */
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L860_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L871_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L882_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L893_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		call	STDOUT_NEWLN	; newln
		add	eax, 1
		mov	dword ptr [L807_add1__hla_+0], eax	;/* add1 */
		add	eax, 1
		mov	dword ptr [L808_add2__hla_+0], eax	;/* add2 */
		add	eax, 1
		mov	dword ptr [L809_add3__hla_+0], eax	;/* add3 */
		add	eax, 1
		mov	dword ptr [L810_add4__hla_+0], eax	;/* add4 */
		push	dword ptr [L807_add1__hla_+0]	; (type int32 add1)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L923_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L808_add2__hla_+0]	; (type int32 add2)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L934_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L945_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L809_add3__hla_+0]	; (type int32 add3)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L956_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L810_add4__hla_+0]	; (type int32 add4)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		call	STDOUT_NEWLN	; newln
		add	eax, 1
		mov	dword ptr [L811_add5__hla_+0], eax	;/* add5 */
		add	eax, 1
		mov	dword ptr [L812_add6__hla_+0], eax	;/* add6 */
		add	eax, 1
		mov	dword ptr [L813_add7__hla_+0], eax	;/* add7 */
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L986_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L811_add5__hla_+0]	; (type int32 add5)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L997_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L1008_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L812_add6__hla_+0]	; (type int32 add6)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L1019_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L813_add7__hla_+0]	; (type int32 add7)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		add	eax, 1
		mov	dword ptr [L814_add8__hla_+0], eax	;/* add8 */
		add	eax, 1
		mov	dword ptr [L815_add9__hla_+0], eax	;/* add9 */
		add	eax, 1
		mov	dword ptr [L816_add10__hla_+0], eax	;/* add10 */
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L1049_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L814_add8__hla_+0]	; (type int32 add8)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L1060_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L1071_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L815_add9__hla_+0]	; (type int32 add9)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L1082_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L816_add10__hla_+0]	; (type int32 add10)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		add	eax, 1
		mov	dword ptr [L817_add11__hla_+0], eax	;/* add11 */
		add	eax, 1
		mov	dword ptr [L818_add12__hla_+0], eax	;/* add12 */
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L1112_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L1123_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_startingValue__hla_+0]	; (type int32 startingValue)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L1134_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L817_add11__hla_+0]	; (type int32 add11)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L1145_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L818_add12__hla_+0]	; (type int32 add12)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


