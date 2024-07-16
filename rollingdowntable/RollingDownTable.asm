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

		include	'RollingDownTable.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'RollingDownTable.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'RollingDownTable.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'RollingDownTable.consts.inc'

		include	'RollingDownTable.ro.inc'

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


		push	L820_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_startingValue__hla_+0], al	;/* startingValue */
		push	L834_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_startingValue__hla_+0]	; startingValue
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L852_str__hla_
		call	STDOUT_PUTS	; puts
		add	al, 1
		mov	bl, al
		push	ebx
		call	STDOUT_PUTI8	; puti8
		push	L866_str__hla_
		call	STDOUT_PUTS	; puts
		mov	cl, bl
		add	cl, 1
		push	ecx
		call	STDOUT_PUTI8	; puti8
		push	L880_str__hla_
		call	STDOUT_PUTS	; puts
		mov	dl, cl
		add	dl, 1
		push	edx
		call	STDOUT_PUTI8	; puti8
		push	L894_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		rol	byte ptr [L806_startingValue__hla_+0], 1	;/* startingValue */
		mov	ah, byte ptr [L806_startingValue__hla_+0]	;/* startingValue */
		sub	esp, 4
		mov	byte ptr [ESP+0], ah
		call	STDOUT_PUTI8	; puti8
		push	L921_str__hla_
		call	STDOUT_PUTS	; puts
		mov	bh, ah
		add	bh, 2
		sub	esp, 4
		mov	byte ptr [ESP+0], bh
		call	STDOUT_PUTI8	; puti8
		push	L935_str__hla_
		call	STDOUT_PUTS	; puts
		mov	ch, bh
		add	ch, 2
		sub	esp, 4
		mov	byte ptr [ESP+0], ch
		call	STDOUT_PUTI8	; puti8
		push	L949_str__hla_
		call	STDOUT_PUTS	; puts
		mov	dh, ch
		add	dh, 2
		sub	esp, 4
		mov	byte ptr [ESP+0], dh
		call	STDOUT_PUTI8	; puti8
		push	L963_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		ror	al, 1
		and	al, 127
		mov	byte ptr [L806_startingValue__hla_+0], al	;/* startingValue */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_startingValue__hla_+0]	; (type int8 startingValue)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L996_str__hla_
		call	STDOUT_PUTS	; puts
		ror	bl, 1
		and	bl, 127
		mov	byte ptr [L806_startingValue__hla_+0], bl	;/* startingValue */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_startingValue__hla_+0]	; (type int8 startingValue)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L1016_str__hla_
		call	STDOUT_PUTS	; puts
		ror	cl, 1
		and	cl, 127
		mov	byte ptr [L806_startingValue__hla_+0], cl	;/* startingValue */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_startingValue__hla_+0]	; (type int8 startingValue)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L1036_str__hla_
		call	STDOUT_PUTS	; puts
		ror	dl, 1
		and	dl, 127
		mov	byte ptr [L806_startingValue__hla_+0], dl	;/* startingValue */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_startingValue__hla_+0]	; (type int8 startingValue)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
		rol	ah, 1
		sub	esp, 4
		mov	byte ptr [ESP+0], ah
		call	STDOUT_PUTI8	; puti8
		push	L1069_str__hla_
		call	STDOUT_PUTS	; puts
		rol	bh, 1
		sub	esp, 4
		mov	byte ptr [ESP+0], bh
		call	STDOUT_PUTI8	; puti8
		push	L1083_str__hla_
		call	STDOUT_PUTS	; puts
		rol	ch, 1
		sub	esp, 4
		mov	byte ptr [ESP+0], ch
		call	STDOUT_PUTI8	; puti8
		push	L1097_str__hla_
		call	STDOUT_PUTS	; puts
		rol	dh, 1
		sub	esp, 4
		mov	byte ptr [ESP+0], dh
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
		ror	al, 1
		push	eax
		call	STDOUT_PUTI8	; puti8
		push	L1124_str__hla_
		call	STDOUT_PUTS	; puts
		ror	bl, 1
		push	ebx
		call	STDOUT_PUTI8	; puti8
		push	L1138_str__hla_
		call	STDOUT_PUTS	; puts
		ror	cl, 1
		and	cl, 127
		mov	byte ptr [L806_startingValue__hla_+0], cl	;/* startingValue */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_startingValue__hla_+0]	; (type int8 startingValue)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L1158_str__hla_
		call	STDOUT_PUTS	; puts
		ror	dl, 1
		and	dl, 127
		mov	byte ptr [L806_startingValue__hla_+0], dl	;/* startingValue */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_startingValue__hla_+0]	; (type int8 startingValue)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


